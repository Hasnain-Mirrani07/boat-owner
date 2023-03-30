import 'dart:developer';

import 'package:boat_owner/app/global_widgets/reuseable_button.dart';
import 'package:boat_owner/app/themes/AppAssets.dart';
import 'package:boat_owner/app/themes/styles/textstyle.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../themes/AppColors.dart';
import '../../themes/AppDimensions.dart';

class Remark_us extends StatefulWidget {
  @override
  State<Remark_us> createState() => _Remark_usState();
}

class _Remark_usState extends State<Remark_us> {
  int i = 0;

  double? _ratingValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance.collection("ratings").get().then((querySnapshot) {
      for (var result in querySnapshot.docs) {
        setState(() {
          sumTotal = sumTotal + result["star_rating"]; // make sure you create the variable sumTotal somewhere
        });
      }
    });
    log(sumTotal.toString());
  }

  var sumTotal;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Align(
                    alignment: FractionalOffset.topLeft,
                    child: Icon(
                      Icons.close,
                      color: AppColors.icon_clr,
                      size: AppDimensions.kXLargeSize,
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 37),
                    Text("How do you like booking?".tr, style: AppTextStyles.kPrimaryS9W6),
                    const SizedBox(height: 10),
                    const Text("For boat Comfort and boat owner behaviour", style: AppTextStyles.kPrimaryS7W4),
                    const SizedBox(height: 22),
                    Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Container(
                          width: 110,
                          height: 39,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(23),
                            color: AppColors.blue_con,
                          ),
                          child: TextButton.icon(
                            onPressed: () {},
                            icon: Text(
                              "Everything".tr,
                              style: TextStyle(color: Colors.white),
                            ),
                            label: SvgPicture.asset('assets/icons/tick.svg'),
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          width: 85,
                          height: 39,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(23),
                            color: i == 0 ? Color(0xffF6F6FF) : AppColors.blue_con,
                          ),
                          child: TextButton.icon(
                              onPressed: () {
                                setState(() {
                                  i++;
                                });
                              },
                              icon: Text("Boat".tr, style: TextStyle(color: i == 0 ? Colors.black : Colors.white)),
                              label: i == 0
                                  ? Icon(Icons.add_circle_outline_sharp, color: Colors.blue, size: 19)
                                  : SvgPicture.asset('assets/icons/tick.svg')),
                        ),
                        SizedBox(width: 20),
                        Container(
                          margin: EdgeInsets.only(top: 6, bottom: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(23),
                            color: Color(0xffF6F6FF),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: TextButton.icon(
                              onPressed: () {},
                              icon: Text(
                                "Service".tr,
                                style: TextStyle(color: Colors.black),
                              ),
                              label: Icon(Icons.add_circle_outline_sharp, color: Colors.blue, size: 19),
                            ),
                          ),
                        ),
                        SizedBox(height: 6),
                        SizedBox(width: 20),
                        Container(
                          margin: EdgeInsets.only(top: 6, bottom: 6),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(23), color: Color(0xffF6F6FF)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: TextButton.icon(
                              onPressed: () {},
                              icon: Text(
                                "Service".tr,
                                style: TextStyle(color: Colors.black),
                              ),
                              label: Icon(Icons.add_circle_outline_sharp, color: Colors.blue, size: 19),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          margin: EdgeInsets.only(top: 6, bottom: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(23),
                            color: Color(0xffF6F6FF),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: TextButton.icon(
                              onPressed: () {},
                              icon: Text(
                                "Service".tr,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              label: Icon(Icons.add_circle_outline_sharp, color: Colors.blue, size: 19),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 38,
                    ),
                    Text("Remarks for us?".tr, style: AppTextStyles.kPrimaryS9W6),
                    const SizedBox(height: 10),
                    Text("Give us rating star & write few words for better suggestion".tr,
                        textAlign: TextAlign.center, style: AppTextStyles.kPrimaryS7W4),
                    const SizedBox(height: 23),
                    Wrap(
                      children: [
                        RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          unratedColor: Colors.white,
                          itemPadding: EdgeInsets.symmetric(horizontal: 6.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Color(0xffFFD913),
                          ),
                          onRatingUpdate: (rating) {
                            setState(() {
                              _ratingValue = rating;
                            });
                          },
                        )
                      ],
                    ),
                    const SizedBox(height: 33),
                    Container(
                      margin: EdgeInsets.only(bottom: 16),
                      height: 170,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        maxLines: 8,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left: 6),
                            hintText: 'Write few words...'.tr,
                            border: InputBorder.none),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Reuseable_button("Submit Review".tr, AppColors.Sdark_blue, Appassets.icon_search1, () {
                      FirebaseFirestore.instance.collection('ratings').doc().set({
                        'star_rating': _ratingValue,
                      });

                      log(_ratingValue.toString());
                    }),
                    const SizedBox(height: 14),
                    const SizedBox(height: 14),
                    const SizedBox(height: 14),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}