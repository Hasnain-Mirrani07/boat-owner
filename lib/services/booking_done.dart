import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class Booking_request{

  static booking_request({

    required var boat_name,
    required var img1,
    required var id,
    required var start,
    required var end,
    required var booking_id,
    required var total_amount,
    required var hours,
    required var overview,
    required var documnet,
    required var token,

  })
async{
  final FirebaseAuth auth = FirebaseAuth.instance;
  var id1 = Uuid();
var uuid=id1.v4();
  FirebaseFirestore.instance.collection("booking_request").doc(id).collection('allrequest').doc(uuid.toString()).set({
    'rbname':boat_name,
    'rbimage':img1,
    'rbuid':auth.currentUser!.uid,
    'rbooking_id':booking_id,
    'rtotal_amount':total_amount,
    'rstart':start,
    'rend':end,
    'rhours':hours,
    'roverview':overview,
    'documnet_id':documnet,
    'booking_status':'● Booked',
    'checking_status':'0',
    'token':token,
    'doc_id':uuid.toString(),
  });
 FirebaseFirestore.instance.collection("booking_requestforowner").doc(auth.currentUser!.uid).collection('allrequest').doc(uuid.toString()).set({
    'rbname':boat_name,
    'rbimage':img1,
    'rbuid':auth.currentUser!.uid,
    'rbooking_id':booking_id,
    'rtotal_amount':total_amount,
    'rstart':start, 'sender_user_id':id,
    'rend':end,
    'rhours':hours,
    'roverview':overview,
    'documnet_id':documnet,
    'booking_status':'● Booked',
    'checking_status':'0',
   'doc_id':uuid.toString(),
  });
} }