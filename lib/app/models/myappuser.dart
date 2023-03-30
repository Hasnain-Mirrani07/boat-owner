import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MyAppUser extends GetxService {
  static MyAppUser get find => Get.find();

  late String id;

  String? name;

  String? email; // on reset password page, this field can be null
  String? profileurl;
  String? totalBooking;
  int? createdAt;


  MyAppUser();

  update(MyAppUser? user) {
    if(user == null || user.id == "") return;
    id = user.id;
    name = user.name;
    email = user.email;
    profileurl = user.profileurl;
    createdAt = user.createdAt;
    totalBooking = user.totalBooking;
    // debugPrint("After update: ${toMap()}");
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': id,
      'p_name': name.toString(),
      'email': email,
      'total_bookings': totalBooking ?? "0",
      'p_image': profileurl,
      'createdAt': createdAt,
    };
  }

  MyAppUser.fromMap(map, {String? userId})
      : id = userId ?? map['userId'] ?? '',
        name = map['p_name'],
        email = map['email'],
        totalBooking = map["total_bookings"] ?? "0",
        profileurl = map['p_image']

  ;

  MyAppUser.fromSnapshot(DocumentSnapshot snapshot) : this.fromMap(snapshot.data(), userId: snapshot.reference.id);

  Future<void> signOut() async {
    //TODO: implement signout functioanlity here....

    await FirebaseAuth.instance.signOut();
  }
}