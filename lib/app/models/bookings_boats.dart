import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Booking_Boats {
  String? end_time;
  String?  start_time;
  String? booking_id;
  String? image;
  String? boat_name;
  String? sender_uid;
  var hours_perday;
  var total_amount;
  var overview;
var rating;
var documnet_id;
var booking_status;
var checking;
var sender_user_uid;
var doc_id;

  Booking_Boats({
    this.image,
   this.end_time,
    this.start_time,
    this.booking_id,
    this.boat_name,
    this.sender_uid,
    this.hours_perday,
    this.total_amount,
    this.overview,
    this.rating,
    this.documnet_id,
    this.booking_status,
    this.checking,
    this.sender_user_uid,
    this.doc_id,

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
      'overview':total_amount,
      'rating':rating,
      'documnet_id':documnet_id,
      'booking_status':booking_status,
      'checking':checking,
      'sender_user_uid':sender_user_uid,
      'doc_id':doc_id,
    };
  }

  Booking_Boats.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
  : boat_name = doc.data()!["rbname"],
  image = doc.data()!["rbimage"],
   total_amount = doc.data()!["rtotal_amount"],
  sender_uid = doc.data()!["rbuid"],
        end_time = doc.data()!["rend"],
        booking_id = doc.data()!["rbooking_id"],
  hours_perday = doc.data()!["rhours"],
        start_time= doc.data()!["rstart"],
        overview= doc.data()!["roverview"],
        rating= doc.data()!["documnet_id"],
        booking_status= doc.data()!["booking_status"],
        checking= doc.data()!["checking_status"],
        sender_user_uid= doc.data()!["sender_user_id"],
        doc_id= doc.data()!["doc_id"],
        documnet_id= doc.id;

}
