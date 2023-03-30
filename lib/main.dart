import 'dart:developer';

import 'package:boat_owner/app/bottomapp.dart';
import 'package:boat_owner/app/languages/localization_controller.dart';
import 'package:boat_owner/app/modeules/auth/controller/auth_controller.dart';
import 'package:boat_owner/services/firebase_auth_services.dart';
import 'package:boat_owner/services/firebase_firestore_services.dart';
import 'package:boat_owner/services/local%20notification%20service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'app/languages/LocaleString.dart';
import 'app/models/myappuser.dart';
import 'app/modeules/auth/profile_selection.dart';
import 'app/modeules/auth/views/Sign_in.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  log(message.notification!.title.toString());
  print(message.data.toString());
}

dependencyInjection() async {
  Get.put(LocalizationController(), permanent: true).initStorage();
  Get.put(LocalizationController().initStorage(), permanent: true);
  Get.lazyPut(() => FirebaseAuthService(), fenix: true);
  Get.lazyPut(() => MyAppUser(), fenix: true);
  Get.lazyPut(() => FirebaseFirestoreServices(), fenix: true);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  LocalNotificationService.initialize(null);
  dependencyInjection();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  //
  // Future<bool> chechloogedin() async {
  //   String? value = await storage.read(key: 'uid1');
  //   if (value == null) {
  //     return false;
  //   }
  //   return true;
  // }

  void initState() {
    // TODO: implement initState
    super.initState();

    LocalNotificationService.initialize(context);

    /// TODO Terminated State
    /// 1. This method call when app in terminated state and you get a notification
    // when you click on notification app open from terminated state and
    // you can get notification data in this method
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      print("FirebaseMessaging.instance.getInitialMessage");
      if (message != null) {
        final routeFromMessage = message.data["route"];
        Navigator.of(context).pushNamed(routeFromMessage);

        print(message.notification!.title);
        log(message.notification!.body.toString());
        print("Terminated Message ID: ${message.data["_id"]}");

        //////// In case of DemoScreen ///////////////////
        // if (message.data['_id'] != null) {
        //   Navigator.of(context).push(MaterialPageRoute(
        //       builder: (context) => DemoScreen(id: message.data['_id'])));
        // }
        //////////////////////////////////////////////////
        LocalNotificationService.createAndDisplayNotification(message);
      }
    });

    /// TODO Foreground State
    /// 2. This method only call when App in foreground it mean app must be opened
    FirebaseMessaging.onMessage.listen((message) {
      print("FirebaseMessaging.onMessage.listen");
      if (message.notification != null) {
        log(message.notification!.title.toString());
        log(message.notification!.body.toString());
        log("Foreground Message ID: ${message.data["_id"]}");
        LocalNotificationService.createAndDisplayNotification(message);
      }
    });

    /// TODO Background State
    /// 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print("FirebaseMessaging.onMessageOpenedApp.listen");
      if (message.notification != null) {
        final routeFromMessage = message.data["route"];
        // Navigator.of(context).pushNamed(routeFromMessage);

        log(message.notification!.title.toString());
        log(message.notification!.body.toString());
        print("Background Message ID: ${message.data['_id']}");

        LocalNotificationService.createAndDisplayNotification(message);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
        init: LocalizationController(),
        builder: (localization) {
          print(localization.currentLanguage + "language");
          return ScreenUtilInit(
              designSize: const Size(360, 812),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                return GetMaterialApp(
                  key: UniqueKey(),
                  locale: Locale(localization.currentLanguage),
                  translations: LocalString(),
                  fallbackLocale: const Locale('en', 'US'),
                  initialBinding: AuthBindings(),
                  debugShowCheckedModeBanner: false,
                  home: WillPopScope(
                      onWillPop: () async {
                        return false;
                      },
                      child: WrapperWidget()),
                );
              });
        });
  }
}

class WrapperWidget extends StatelessWidget {
  final bool isSignUp;

  const WrapperWidget({Key? key, this.isSignUp = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MyAppUser?>(
        future: FirebaseFirestoreServices()
            .loadMyAppUserData(uid: FirebaseAuth.instance.currentUser?.uid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashWidget();
          }

          /// If user is from signup (number verification) then go to profile selection
          // if (isSignUp) {
          //   MyAppUser myAppUser = MyAppUser();
          //   myAppUser.id = FirebaseAuth.instance.currentUser!.uid;
          //   MyAppUser.find.update(myAppUser);
          //   _gotoHomeOrCompleteProfileScreen();
          // }

          if (snapshot.data != null || isSignUp) {
            MyAppUser myAppUser = MyAppUser();
            myAppUser.id = FirebaseAuth.instance.currentUser!.uid;
            isSignUp
                ? MyAppUser.find.update(myAppUser)
                : MyAppUser.find.update(snapshot.data);
            _gotoHomeOrCompleteProfileScreen();
            return SplashWidget();
          } else {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              Get.offAll(() => const Sign_in(), binding: AuthBindings());
            });
            // Future.delayed(400.milliseconds).then((value) => Get.offAll(const Sign_in()));
          }

          return SplashWidget();
        });
  }

  _gotoHomeOrCompleteProfileScreen() async {
    debugPrint("gotoHomeOrCompleteProfileScreen ${MyAppUser.find.toMap()}");
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (MyAppUser.find.profileurl == null || MyAppUser.find.name == null) {
        Get.offAll(Profile_Selection());
      } else {
        Get.offAll(Home());
      }
    });
  }

  Widget SplashWidget() {
    return Center(
      child: Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: Lottie.asset(
            'assets/lottie/splash_boat.json',
            // width: MediaQuery.of(context).size.width,
            // height: 450,
            repeat: true,
            fit: BoxFit.cover,
          )
          // Text("Splash Image"),
          ),
    );
  }
}
