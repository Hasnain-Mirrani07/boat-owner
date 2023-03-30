import 'dart:developer';

import 'package:boat_owner/app/models/bookings_boats.dart';
import 'package:boat_owner/app/modeules/bookings%20and%20favorites/booking_page.dart';
import 'package:boat_owner/services/booking_done.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class done_booking extends GetxController {
  // done_booking(var sender_uid,{this.sender_uid=sender_uid1});


var total_rating;
void get_rating(rate)async{
  var data;
  await FirebaseFirestore
      .instance
      .collection('boats')
      .doc(rate)
      .get()
      .then((doc) =>
  {data = doc.data()})
      .catchError((error) => {
    debugPrint(
        "Error on get data from User"),
    print(error
        .toString())
  });

  total_rating =
  data['total_rating'];
}

final FirebaseAuth _auth = FirebaseAuth.instance;
var token;

 var sender_uid;
  void send_request(

{var boat_name,
      var image,
      var uid,
      booking_id,
      start,
      end,
      hours,
      total_amount,overview,documnet_id}) {
    FirebaseFirestore.instance.collection('Users').doc(_auth.currentUser!.uid)
        .get().then((DocumentSnapshot) =>
    token=DocumentSnapshot.data()!['token']
    ).whenComplete(() {
      log(token.toString())
      ;    Booking_request.booking_request(
          token: token,
          documnet:documnet_id,
          overview: overview,
          boat_name: boat_name,
          img1: image,
          id: uid,
          booking_id: booking_id,
          hours: hours,
          start: start,
          end: end,
          total_amount: total_amount);
    });

  }

  final FirebaseFirestore _db = FirebaseFirestore.instance;
var data;
var rating;

var doc_id;
 Future<void> getreview(doc_uid) async {
   doc_id=doc_uid;
  await FirebaseFirestore.instance.collection("boats").doc(doc_uid).get().then((value) {
    Map<String, dynamic>? get_data = value.data();
   rating=get_data?['total_rating'];

  }
  );

 }
 Future<List<Booking_Boats>>? boats;
 List<Booking_Boats>? retrievedboats;
  Future<List<Booking_Boats>> retrieveEmployees({s}) async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    QuerySnapshot<Map<String, dynamic>> snapshot = await _db
        .collection('booking_requestforowner')
        .doc(auth.currentUser!.uid)
        .collection('allrequest')
        .get();
    return snapshot.docs
        .map((docSnapshot) => Booking_Boats.fromDocumentSnapshot(docSnapshot))
        .toList();
  }
 Future<void> initRetrieval({g}) async {
   boats = retrieveEmployees();
   retrievedboats = await retrieveEmployees(s: g);
 }
}


