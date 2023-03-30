import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Pending_bookings {
  String? end_time;
  String?  start_time;
  String? booking_id;
  String? image;
  String? boat_name;
  String? sender_uid;
  var hours_perday;
  var total_amount;


  Pending_bookings({
    this.image,
   this.end_time,
    this.start_time,
    this.booking_id,
    this.boat_name,
    this.sender_uid,
    this.hours_perday,
    this.total_amount,

  });

  Map<String, dynamic> toMap() {
    return {
      'boatname':boat_name,
      'image': image,
      'booking_id': booking_id,
      'hours_perday':hours_perday,
      'start_time': start_time,
      'end_time': end_time,
      'sender_uid': sender_uid,
      'total_amount':total_amount,
    };
  }

  Pending_bookings.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
  : boat_name = doc.data()!["pending_bname"],
  image = doc.data()!["pending_bimage"],
   total_amount = doc.data()!["total_amount"],
  sender_uid = doc.data()!["sender_uid"],
        end_time = doc.data()!["end_time"],
        booking_id = doc.data()!["id"],
  hours_perday = doc.data()!["hours_perday"],
        start_time= doc.data()!["start_time"];

}
