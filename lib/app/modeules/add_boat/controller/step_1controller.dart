import 'dart:developer';
import 'dart:io';

import 'package:boat_owner/services/add_boat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Step_1Controller extends GetxController {
  bool? disable;

  disable_button() {
    disable = true;
    update();
  }

  enable_button() {
    disable == false;
    update();
  }

  final TextEditingController boatname = TextEditingController();

  final TextEditingController aboutboat = TextEditingController();

  final TextEditingController boatprice = TextEditingController();

  final TextEditingController maxpersons = TextEditingController();

  final TextEditingController priceperseat = TextEditingController();

  final TextEditingController feature1 = TextEditingController();

  final TextEditingController feature2 = TextEditingController();
  final TextEditingController feature3 = TextEditingController();
  final TextEditingController feature4 = TextEditingController();
  final TextEditingController feature5 = TextEditingController();
  final TextEditingController feature6 = TextEditingController();
  final TextEditingController feature7 = TextEditingController();

  int i = 0;
  final TextEditingController overview = TextEditingController();
  double start = 1;
  double end = 12;
  bool rentbyseat = false;

  File? image;
  File? image2;

  File? image3;
  File? image4;
  File? image5;

  bool facilityone = false;

  bool facilitytwo = false;

  bool facilitythree = false;

  bool facilityfour = false;
  bool ic = false;
  bool ic1 = false;
  bool ic2 = false;
  bool ic3 = false;
  bool ic4 = false;
  bool ic5 = false;
  bool ic6 = false;
  String text1 = "Lorem impsum facility one";

  String text2 = "Lorem impsum facility two text";

  String text3 = "Lorem impsum facility three text";

  String text4 = "Lorem impsum facility four text";
  int index = 0;
  List visible = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  String mon = "Monday";
  String tue = "Tuesday";
  String wed = "Wednesday";
  String thu = "Thursday";
  String fri = "Friday";
  String sat = "Saturday";
  String sun = "Sunday";
  String? uid;
  final FirebaseAuth auth = FirebaseAuth.instance;
  var token;

  Future<void> send_data() async {
   await FirebaseFirestore.instance.collection('Users').doc(auth.currentUser!.uid)
        .get().then((DocumentSnapshot) =>
    token=DocumentSnapshot.data()!['token']
    );

    final User? user = auth.currentUser;
    final uid = user!.uid;
    final storageReference = FirebaseStorage.instance.ref();
    final reference = storageReference.child(image!.path);

    UploadTask uploadTask = reference.putFile(image!);
    final snapshot = await uploadTask.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    log("$urlDownload");

    // Future<Uri> uploadPic() async {
    //
    //   //Get the file from the image picker and store it
    //   File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    //
    //   //Create a reference to the location you want to upload to in firebase
    //   StorageReference reference = _storage.ref().child("images/");
    //
    //   //Upload the file to firebase
    //   StorageUploadTask uploadTask = reference.putFile(file);
    //
    //   // Waits till the file is uploaded then stores the download url
    //   Uri location = (await uploadTask.future).downloadUrl;
    //
    //   //returns the download url
    //   return location;
    // }




    AddBoat.addboat(
      token:token,
      start: start,
      end: end,
      boat_name: boatname.text,
      boat_price: boatprice.text,
      about_boat: aboutboat.text,
      max_persons: maxpersons.text,
      overview: overview.text,
      img1: urlDownload,
      user_uid: uid,
      // img3: image3,
      // img4: image4,
      // img5: image5,
      rentbyseat: rentbyseat == true ? priceperseat.text : null,
      fac1: facilityone == true ? text1 : null,
      fac2: facilitytwo == true ? text2 : null,
      fac3: facilitythree == true ? text3 : null,
      fac4: facilityfour == true ? text3 : null,
      feature1: feature1.text,
      feature2: feature2.text,
      feature3: feature3.text,
      feature4: feature4.text,
      feature5: feature5.text,
      feature6: feature6.text,
      feature7: feature7.text,
      mon: ic == true ? mon : null,
      tue: ic1 == true ? tue : null,
      wed: ic2 == true ? wed : null,
      thu: ic3 == true ? thu : null,
      fri: ic4 == true ? fri : null,
      sat: ic5 == true ? sat : null,
      sun: ic6 == true ? sun : null,
    );
  }
}