import 'dart:developer';

import 'package:boat_owner/app/bottomapp.dart';
import 'package:boat_owner/app/languages/localization_controller.dart';
import 'package:boat_owner/app/modeules/booking_boat/upcoming_booking/controller.dart';
import 'package:boat_owner/app/modeules/booking_boat/widget/boat_expenses.dart';
import 'package:boat_owner/app/modeules/booking_boat/widget/boating_duration.dart';
import 'package:boat_owner/app/themes/AppColors.dart';
import 'package:boat_owner/app/themes/AppDimensions.dart';
import 'package:boat_owner/app/themes/styles/textstyle.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../global_widgets/reuseable_button.dart';
import '../../models/start_rating.dart';
import '../../themes/AppAssets.dart';

class Booking_detalis extends StatefulWidget {
  Booking_detalis({this.inde, this.rating, this.checking_completeing});

  var inde;
  var rating;
  var checking_completeing;

  @override
  State<Booking_detalis> createState() => _Booking_detalisState();
}

class _Booking_detalisState extends State<Booking_detalis> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  final con1 = Get.put(done_booking());
  var data;
  var star_rating;

  Future<void> getdata() async {
    await FirebaseFirestore.instance
        .collection('boats')
        .doc(widget.rating)
        .get()
        .then((doc) => {data = doc.data()})
        .catchError((error) => {debugPrint("Error on get data from User"), print(error.toString())});

    star_rating = data['total_rating'];
    log(star_rating.toString());
    log(widget.rating.toString());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        body: FutureBuilder(
            future: con1.boats,
            builder: (BuildContext context, snapshot) {
              return ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(Icons.arrow_back, color: AppColors.icon_clr, size: AppDimensions.kXLargeSize)),
                        const SizedBox(height: 12),
                        Text("Booking Details".tr, style: AppTextStyles.ktitle),
                        const SizedBox(height: 13),
                        Container(
                          width: double.infinity,
                          height: 29,
                          decoration: BoxDecoration(
                            color: Color(0xff494AFF),
                            borderRadius: BorderRadius.circular(17),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "Booking ID: ${con1.retrievedboats![widget.inde].booking_id!.substring(0, 7)}",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        Get.to(Home());
                                      },
                                      child: Text(widget.checking_completeing == true ? "Cancel Now".tr : "Completed".tr,
                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 11))),
                                  Icon(
                                      Get.find<LocalizationController>().isEnglish()
                                          ? Icons.arrow_forward_ios_outlined
                                          : Icons.arrow_back_ios_new_outlined,
                                      color: Colors.white,
                                      size: 18)
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                        imageUrl: "${con1.retrievedboats![widget.inde!].image}",
                                        width: 80,
                                        height: 80,
                                        fit: BoxFit.cover)),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${con1.retrievedboats?[widget.inde].boat_name}", style: AppTextStyles.kPrimaryS5W4),
                                  Text("${con1.retrievedboats![widget.inde!].overview.substring(0, 12)} ",
                                      style: AppTextStyles.kPrimaryS7W4),
                                  const SizedBox(height: 5),
                                  StarRating(rating: widget.rating)
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text("Boating Duration", style: AppTextStyles.kPrimaryS7W5),
                        const SizedBox(height: 20),
                        Boating_Duration("${con1.retrievedboats![widget.inde!].start_time}:00",
                            "${con1.retrievedboats![widget.inde!].end_time}:00"),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 19.0),
                          child: Container(width: double.infinity, height: 1, color: Colors.black12),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("Total Expenses".tr, style: AppTextStyles.kPrimaryS7W5),
                        const SizedBox(
                          height: 20,
                        ),
                        Boat_Expenses("Hours Per Day".tr, "${con1.retrievedboats![widget.inde!].hours_perday}"),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Container(width: double.infinity, height: 1, color: Colors.black12),
                        ),
                        Boat_Expenses("Amount Paid".tr, "\$${con1.retrievedboats![widget.inde!].total_amount}"),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Container(width: double.infinity, height: 1, color: Colors.black12),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 2.4,
                          child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 30.0, bottom: 20),
                              child: GestureDetector(
                                onTap: () {},
                                child: Reuseable_button("Contact Customer".tr, Color(0xff001B48), Appassets.icon_search1, () {
                                  Get.to(Home());
                                }),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}