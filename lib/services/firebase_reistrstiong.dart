import 'dart:developer';

import 'package:boat_owner/app/models/myappuser.dart';
import 'package:boat_owner/app/modeules/auth/profile_selection.dart';
import 'package:boat_owner/app/modeules/remark_us/remark_us_screen.dart';
import 'package:boat_owner/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../app/bottomapp.dart';
import 'firebase_firestore_services.dart';
class FirebaseMethods{



  static Future <void> generateTokenAndSaveToDb() async {

    debugPrint("***generating toke***");
    if(FirebaseAuth.instance.currentUser?.uid == null)return;
    FirebaseMessaging.instance.getToken().then((value) => {
      FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser?.uid ?? "")
          .update({"token": value}),SetOptions(merge: true)
    });
  }
  static firebaseSign ({required String email,required String password}) async {
    // final storage = new FlutterSecureStorage();

    User? user;
    try{
      user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email:email, password:password)).user;
      print(user!.uid);
      // await storage.write(key: 'uid1', value: user.uid);

      Get.to(Home());
    }
    on FirebaseAuthException catch  (e) {
      Get.snackbar(
        "Error",
        e.message.toString(),
        icon: Icon(Icons.person, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );

    }


  }


  FirebaseAuth auth = FirebaseAuth.instance;

  static firebaseSignup ({required String email,required String password}) async {
    User? user;
    try {
      // final storage = new FlutterSecureStorage();

      user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password)).user;
      print(user!.uid);
      FirebaseFirestore.instance.collection('Users').doc(user.uid).set({
        'email': email,
        'uid': user.uid,
      });
      // await storage.write(key: 'uid1', value: user.uid);

      Get.to(Profile_Selection());
    }
    on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error",
        e.message.toString(),
        icon: Icon(Icons.person, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,

      );
    }

  }
  Future<void> signup(BuildContext context,bool checkinglooged) async {
    try{

      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn
          .signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);

        // Getting users credential
        UserCredential result = await auth.signInWithCredential(authCredential);
        User? user = result.user;
        FirebaseFirestore.instance.collection("Users").doc(user!.uid).set({
          "p_image": user.photoURL,
          'p_name': user.displayName,
          'total_bookings': 0.toString(),
        });
        // await storage.write(key: 'uid1', value: user.uid);


        MyAppUser? myUser = await  FirebaseFirestoreServices().loadMyAppUserData(
            uid: FirebaseAuth.instance.currentUser?.uid);
        if(myUser != null){
          Get.off(WrapperWidget());
          // checkinglooged==true?  Navigator.pushReplacement(
          //     context, MaterialPageRoute(builder: (context) => Home())):Get.to(Home());
          // }



        } // if result not null we simply call the MaterialpageRoute,
        // for go to the HomePage screen
      }
    }on FirebaseAuthException catch  (e){
      Get.snackbar(
        "Error",
        e.message.toString(),
        icon: Icon(Icons.person, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,

      );
    }
  }

}