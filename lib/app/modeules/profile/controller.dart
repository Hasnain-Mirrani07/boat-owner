import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Get_User_Data extends GetxController {

 final isSwitched = false.obs;
 void storeStatusOpen(bool isOpen) {
   isSwitched(isOpen);
 }
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? name;
  String? image;
  var data;

  Future<void> getdata() async {

   FirebaseFirestore.instance.collection('Users')
      .doc(_auth.currentUser!.uid)
      .get()
      .then((doc) => {data = doc.data()})
      .catchError((error) =>
  {log("Error on get data from User"), print(error.toString())});

  name = data["p_name"];
  image = data["p_image"];
}
}
