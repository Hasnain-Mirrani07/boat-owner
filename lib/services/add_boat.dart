import 'package:boat_owner/app/modeules/add_boat/controller/step_1controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../singaltonClass.dart';

class AddBoat {
  static addboat({
    required var boat_name,
    required var about_boat,
    required var boat_price,
    required var max_persons,
    required var overview,
    required var img1,
    required var token,
    // required var img2,
    // required var img3,
    // required var img4,
    required var rentbyseat,
    // required var img5,
    required var fac1,
    required var fac2,
    required var fac3,
    required var fac4,
    required var feature1,
    required var feature2,
    required var feature3,
    required var feature4,
    required var feature5,
    required var feature6,
    required var feature7,
    required var mon,
    required var tue,
    required var wed,
    required var thu,
    required var fri,
    required var sat,
    required var sun,
    required var start,
    required var end,
    required var user_uid,
  }) async {
    List<String> userId = [FirebaseAuth.instance.currentUser!.uid];
    var id1 = Uuid();
    var uuid = id1.v4();
    FirebaseFirestore.instance.collection("boats").doc(uuid).set({
      'owneruid': SessionController().userId,
      'boat_namae': boat_name,
      'about_boat': about_boat,
      'boat_price': boat_price,
      'max_persons': max_persons,
      'overview': overview,
      'img1': img1,
      'uid': user_uid,
      'token': token,
      'check_fav': true,
      'uuuid': uuid.toString(),
      'likedby': FieldValue.arrayUnion(userId),
      'id': FirebaseAuth.instance.currentUser!.uid.toString(),
      // 'img3':img3,
      // 'img4':img4,
      // 'img5':img5,

      'rentbyseat': rentbyseat,
      'facility1': fac1,
      'facility2': fac2,
      'facility3': fac3,
      'facility4': fac4,
      'feature1': feature1,
      'feature2': feature2,
      'feature3': feature3,
      'feature4': feature4,
      'feature5': feature5,
      'feature6': feature6,
      'feature7': feature7,
      'monday': mon,
      'tuesday': tue,
      'wed': wed,
      'thu': thu,
      'fri': fri,
      'sat': sat,
      'sun': sun,
      'total_rating': 1.toDouble(),
      'numbers': 1,
      'rating': 1,
      'boating_duration_start': start.toStringAsFixed(0),
      'boating_duration_end': end.toStringAsFixed(0),
    });
    final con = Get.put(Step_1Controller());
    FirebaseFirestore.instance
        .collection("users_boat")
        .doc(user_uid)
        .collection("allboats")
        .doc(uuid)
        .set({
      'boat_namae': boat_name,
      'about_boat': about_boat,
      'boat_price': boat_price,
      'max_persons': max_persons,
      'overview': overview,
      'img1': img1,
      'total_rating': 0.toDouble(),
      'numbers': 1,
      'rating': 1,
      // 'img2':img2,
      // 'img3':img3,
      // 'img4':img4,
      // 'img5':img5,
      'rentbyseat': rentbyseat,
      'facility1': fac1,
      'facility2': fac2,
      'facility3': fac3,
      'facility4': fac4,
      'feature1': feature1,
      'feature2': feature2,
      'feature3': feature3,
      'feature4': feature4,
      'feature5': feature5,
      'feature6': feature6,
      'feature7': feature7,
      'monday': mon,
      'tuesday': tue,
      'wed': wed,
      'thu': thu,
      'fri': fri,
      'sat': sat,
      'sun': sun,
      'boating_duration_start': start.toStringAsFixed(0),
      'boating_duration_end': end.toStringAsFixed(0),
      'owneruid': SessionController().userId,
      'request': "pending"
    });
  }
}
