
import 'dart:developer';

import 'package:boat_owner/app/modeules/add_boat/add_boat_step1.dart';
import 'package:boat_owner/app/modeules/booking_boat/upcoming_booking/controller.dart';
import 'package:boat_owner/app/modeules/bookings%20and%20favorites/widget/ui.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../../themes/AppColors.dart';
import '../../themes/styles/textstyle.dart';
import '../add_boat/controller/step_1controller.dart';

class Favorite_page extends StatefulWidget {
  Favorite_page({this.uid, this.documnet_id});
String? uid;
String? documnet_id;
  @override
  State<Favorite_page> createState() => _Favorite_pageState();
}

class _Favorite_pageState extends State<Favorite_page> {

  final FirebaseAuth auth = FirebaseAuth.instance;
  int currentIndex=1;
  final con=Get.put(done_booking());
  @override

  void initState() {
    con.getreview(widget.documnet_id);
    // TODO: implement initState
    super.initState();

    log(con.rating.toString());

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white
      ,
      appBar: AppBar(
toolbarHeight: 90,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title:  Padding(
          padding: const EdgeInsets.only(left:10.0),
          child: Text("My Boats".tr,style: AppTextStyles.ktitle1,),
        ),
      ),
      body:Column(
        children: [

      Expanded(

        child: StreamBuilder<QuerySnapshot>(
          stream:FirebaseFirestore.instance.collection('users_boat').doc("${widget.uid}").collection('allboats').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong'.tr);
            }
            if(snapshot.data==null){
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.data!.size==0 ) {
              return Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/no_results.png',width: 112,height: 112,),
                  SizedBox(height: 15,),
                  GestureDetector(onTap: (){
                    Get.to(Add_boatStep1());
                  },child: Text("Add Boat".tr,style: TextStyle(color: Colors.blue,fontSize: 16),))
                ],
              ));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: const CircularProgressIndicator());
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                return Ui(
                  boatprice: data['boat_price'],
                  persons: data['max_persons'],
                  boatname: data['boat_namae'],
                  image: data['img1'],
                  overview: data['overview'],
                 total_rating: data['total_rating'],
                );
              }).toList(),
            );
          },
        ),
      ),
        ],
      ),
    );
  }


}