import 'package:boat_owner/app/global_widgets/big_divider.dart';
import 'package:boat_owner/app/global_widgets/reuseable_widget.dart';
import 'package:boat_owner/app/languages/arabic_numbers.dart';
import 'package:boat_owner/app/languages/localization_controller.dart';
import 'package:boat_owner/app/models/myappuser.dart';
import 'package:boat_owner/app/modeules/auth/controller/auth_controller.dart';
import 'package:boat_owner/app/modeules/auth/views/Sign_in.dart';
import 'package:boat_owner/app/modeules/profile/controller.dart';
import 'package:boat_owner/app/modeules/settings/widgets/divider.dart';
import 'package:boat_owner/app/themes/styles/textstyle.dart';
import 'package:boat_owner/app/utils/app_constants.dart';
import 'package:boat_owner/services/firebase_firestore_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Verified_Profile extends StatefulWidget {
  @override
  State<Verified_Profile> createState() => _Verified_ProfileState();
}

class _Verified_ProfileState extends State<Verified_Profile> {
  bool isSwitched = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final con = Get.put(Get_User_Data());
  CollectionReference users = FirebaseFirestore.instance.collection('Users');

  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<MyAppUser?>(
          initialData: MyAppUser.find,
          future: FirebaseFirestoreServices().loadMyAppUserData(uid: MyAppUser.find.id),
          builder: (BuildContext context, snapshot) {
            if (snapshot.data != null && snapshot.data?.email != null) {
              MyAppUser.find.update(snapshot.data);
            }
            return ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    Stack(
                      children: [
                        snapshot.data?.profileurl == null
                            ? Image.asset("assets/profile_img.png", width: 90, height: 90)
                            : CircleAvatar(
                                radius: 44,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                    radius: 70,
                                    backgroundColor: Colors.white,
                                    backgroundImage: NetworkImage('${snapshot.data?.profileurl}')),
                              ),
                      ],
                    ),
                    const SizedBox(
                      height: 19
                    ),
                    Text(
                      snapshot.data?.name ?? "",
                      style: AppTextStyles.kPrimaryS7W5
                    ),
                    const SizedBox(
                      height: 16
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text((Get.find<LocalizationController>().isEnglish()? snapshot.data?.totalBooking ?? "0" :(snapshot
                                .data?.totalBooking ?? "0").toArabicNumbers),
                             style:
                            AppTextStyles
                                .kPrimaryS10W1),
                            const SizedBox(height: 2),
                            Text("Total Booking".tr, style: AppTextStyles.kPrimaryS10W2),
                          ],
                        ),
                      ],
                    ),
                    const Big_divider(),
                    ListTile(
                      leading: SvgPicture.asset("assets/icons/notification.svg"),
                      title: Text(
                        "Get Updated".tr,
                        style: AppTextStyles.kPrimaryS7W4
                      ),
                      subtitle: Text(
                        "Notifications".tr,
                        style: AppTextStyles.kPrimaryS8W5
                      ),
                      trailing: Obx(
                        () => CupertinoSwitch(
                          activeColor: Colors.blue,
                          value: con.isSwitched.value,
                          onChanged: (value) => con.isSwitched(value)
                        ),
                      ),
                    ),
                    const Divider_con(),
                    InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Change Language".tr),
                                  content: Container(
                                    height: 200,
                                    child: Column(
                                      children: [
                                        ListTile(
                                          onTap: () {
                                            LocalizationController.find.changeLanguage(AppConstants.ENGLISH_LANGUAGE_CODE);
                                            Get.back();
                                          },
                                          title: Text("English"),
                                        ),
                                        ListTile(
                                          onTap: () {
                                            LocalizationController.find.changeLanguage(AppConstants.ARABIC_LANGUAGE_CODE);
                                            Get.back();
                                          },
                                          title: const Text("Arabic"),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                          // Get.find<LocalizationController>().toggleLanguage();
                        },
                        child: Reuseable_widget(
                            "Language", Get.find<LocalizationController>().isEnglish() == false ? "English" : "Arabic", "language")),
                    Reuseable_widget("Need help".tr, "Help".tr, "help".tr),
                    ListTile(
                      leading: SvgPicture.asset("assets/icons/logout.svg"),
                      title: GestureDetector(
                        onTap: () async {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Are you sure you want to logout?".tr),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: Text("No".tr),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        await _auth.signOut();
                                        await googleSignIn.signOut();
                                        // MyAppUser.find.update(MyAppUser());
                                        Get.offAll(() => Sign_in(), transition: Transition.fadeIn,binding: AuthBindings());
                                      },
                                      child: Text("Yes".tr),
                                    ),
                                  ],
                                );
                              });
                          // Future<GoogleSignInAccount?> _googleSignIn = GoogleSignIn().signOut();
                          // await _auth.signOut();
                          // Get.offAll(Sign_in(), binding: AuthBindings());
                        },
                        child: Text("Logout".tr, style: AppTextStyles.kPrimaryS8W5),
                      ),
                    ),
                    const Divider_con(),
                  ],
                ),
              ],
            );
          }),
    );
  }
}