import 'package:boat_owner/app/bottomapp.dart';
import 'package:boat_owner/app/global_widgets/big_divider.dart';
import 'package:boat_owner/app/global_widgets/mysnackbars.dart';
import 'package:boat_owner/app/modeules/add_boat/controller/step_1controller.dart';
import 'package:boat_owner/app/modeules/booking_boat/thankyou_screen.dart';
import 'package:boat_owner/app/modeules/settings/widgets/divider.dart';
import 'package:boat_owner/app/themes/AppColors.dart';
import 'package:boat_owner/app/themes/styles/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../../global_widgets/loading_indicator.dart';

class Add_boat_step3 extends StatefulWidget {
  @override
  State<Add_boat_step3> createState() => _Add_boat_step3State();
}

class _Add_boat_step3State extends State<Add_boat_step3> {
  RangeValues _currentRangeValues = const RangeValues(40, 80);
  final con = Get.put(Step_1Controller());
  bool? load;

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      load = false;
    });

    super.initState();
  }

  final formGlobalKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          body: Form(
            key: formGlobalKey,
            child: ListView(children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const SizedBox(
                  height: 22,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Get.to(Home());
                          },
                          child: Text("Cancel".tr, style: AppTextStyles.kPrimaryS9W5)),
                      RichText(
                        text: TextSpan(
                            text: '3/'.tr,
                            style: const TextStyle(color: AppColors.title_clr, fontSize: 17, fontWeight: FontWeight.w700),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' ' + '3'.tr,
                                style: const TextStyle(fontSize: 17, color: Colors.grey, fontWeight: FontWeight.w700),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 47),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text("Boat Overview".tr, style: AppTextStyles.kPrimaryS10W1),
                ),
                const SizedBox(height: 17),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  width: double.infinity,
                  height: 196,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please give  overview about your Boat'.tr;
                      } else if (value.length < 14) {
                        return 'Please give more overview about your Boat'.tr;
                      }
                      return null;
                    },
                    controller: con.overview,
                    maxLines: 8,
                    decoration: InputDecoration(
                        hintText: "Tell a little about your boat".tr,
                        hintStyle: AppTextStyles.kPrimaryS2W4,
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: AppColors.S_text),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: AppColors.S_text),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: AppColors.S_text),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: AppColors.S_text),
                          borderRadius: BorderRadius.circular(13),
                        )),
                  ),
                ),
                const SizedBox(height: 20),
                const Big_divider(),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text("Boating Availability".tr, style: AppTextStyles.kPrimaryS10W1),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 38),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        children: [
                          Transform.scale(
                            scale: 1.6,
                            child: Checkbox(
                              side: BorderSide(width: 0.5, color: AppColors.Sdark_blue),
                              activeColor: AppColors.Sdark_blue,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              value: this.con.ic,
                              onChanged: (bool? value) {
                                setState(() {
                                  con.ic = value!;
                                });
                              },
                            ),
                          ), //

                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 8),
                            child: Text(con.mon.tr, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                          ),
                        ],
                      ),
                      Wrap(
                        children: [
                          Transform.scale(
                            scale: 1.6,
                            child: Checkbox(
                              side: BorderSide(width: 0.5, color: AppColors.Sdark_blue),
                              activeColor: AppColors.Sdark_blue,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              value: this.con.ic1,
                              onChanged: (bool? value) {
                                setState(() {
                                  con.ic1 = value!;
                                });
                              },
                            ),
                          ), //

                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 8),
                            child: Text(con.fri.tr, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        children: [
                          Transform.scale(
                            scale: 1.6,
                            child: Checkbox(
                              side: BorderSide(width: 0.5, color: AppColors.Sdark_blue),
                              activeColor: AppColors.Sdark_blue,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              value: this.con.ic2,
                              onChanged: (bool? value) {
                                setState(() {
                                  con.ic2 = value!;
                                });
                              },
                            ),
                          ), //

                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 8),
                            child: Text(
                              con.tue.tr,
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      Wrap(
                        children: [
                          Transform.scale(
                            scale: 1.6,
                            child: Checkbox(
                              side: BorderSide(width: 0.5, color: AppColors.Sdark_blue),
                              activeColor: AppColors.Sdark_blue,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              value: this.con.ic3,
                              onChanged: (bool? value) {
                                setState(() {
                                  con.ic3 = value!;
                                });
                              },
                            ),
                          ), //

                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 8),
                            child: Text(
                              con.sat.tr,
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 29,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        children: [
                          Transform.scale(
                            scale: 1.6,
                            child: Checkbox(
                              side: BorderSide(width: 0.5, color: AppColors.Sdark_blue),
                              activeColor: AppColors.Sdark_blue,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              value: this.con.ic4,
                              onChanged: (bool? value) {
                                setState(() {
                                  con.ic4 = value!;
                                });
                              },
                            ),
                          ), //

                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 8),
                            child: Text(
                              con.wed.tr,
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      Wrap(
                        children: [
                          Transform.scale(
                            scale: 1.6,
                            child: Checkbox(
                              side: BorderSide(width: 0.5, color: AppColors.Sdark_blue),
                              activeColor: AppColors.Sdark_blue,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              value: this.con.ic5,
                              onChanged: (bool? value) {
                                setState(() {
                                  con.ic5 = value!;
                                });
                              },
                            ),
                          ), //

                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 8),
                            child: Text(
                              con.sun.tr,
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        children: [
                          Transform.scale(
                            scale: 1.6,
                            child: Checkbox(
                              side: BorderSide(width: 0.5, color: AppColors.Sdark_blue),
                              activeColor: AppColors.Sdark_blue,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              value: this.con.ic6,
                              onChanged: (bool? value) {
                                setState(() {
                                  con.ic6 = value!;
                                });
                              },
                            ),
                          ), //

                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 8),
                            child: Text(
                              con.thu.tr,
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${con.start.toStringAsFixed(0)} :00",
                        style: AppTextStyles.kPrimaryS11W2,
                      ),
                      Text(
                        "${con.end.toStringAsFixed(0)} :00",
                        style: AppTextStyles.kPrimaryS11W2,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                RangeSlider(
                  min: 0,

                  values: RangeValues(con.start, con.end),
                  max: 24,

                  inactiveColor: Color(0xffF4F5F7),
                  activeColor: AppColors.Sdark_blue,
                  // labels: RangeLabels(
                  //   _currentRangeValues.start.round().toString(),
                  //   _currentRangeValues.end.round().toString(),
                  // ),
                  onChanged: (value) {
                    setState(() {
                      con.start = value.start.toDouble();
                      con.end = value.end.toDouble();
                    });
                  },
                ),
                const SizedBox(
                  height: 39,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Start Time".tr,
                        style: const TextStyle(color: Color(0xff262323), fontSize: 11, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "End Time".tr,
                        style: const TextStyle(color: Color(0xff262323), fontSize: 11, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        " ${con.start.toStringAsFixed(0)} : 00",
                        style: TextStyle(color: Color(0xff262323), fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "  ${con.end.toStringAsFixed(0)}: 00",
                        style: TextStyle(color: Color(0xff262323), fontSize: 16, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
                const Divider_con(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(26.0),
                            )),
                            backgroundColor: MaterialStateProperty.all<Color>(Color(0xffF4F5F7)),
                          ),
                          onPressed: () {
                            Get.back();
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 19),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: 9),
                                Text("Back".tr,
                                    style: TextStyle(color: AppColors.Proyel_blue, fontSize: 15, fontWeight: FontWeight.w700)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                    Expanded(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(17.0))),
                                    backgroundColor: MaterialStateProperty.all<Color>(AppColors.Sdark_blue)),
                                onPressed:isLoading?null :  () async {

                                  FocusScopeNode currentFocus = FocusScope.of(context);
                                  if (!currentFocus.hasPrimaryFocus) {
                                    currentFocus.unfocus();
                                  }

                                  if (formGlobalKey.currentState!.validate()) {
                                    formGlobalKey.currentState!.save();

                                    if (con.ic == false &&
                                        con.ic1 == false &&
                                        con.ic2 == false &&
                                        con.ic3 == false &&
                                        con.ic4 == false &&
                                        con.ic5 == false &&
                                        con.ic6 == false) {
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                        content: Text("Please Select Boating Availability".tr),
                                      ));
                                    } else {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      // Fluttertoast.showToast(
                                      //     msg: "Please wait..",
                                      //     toastLength: Toast.LENGTH_SHORT,
                                      //     gravity: ToastGravity.BOTTOM_RIGHT,
                                      //     timeInSecForIosWeb: 1,
                                      //     backgroundColor: Colors.black,
                                      //     textColor: Colors.white,
                                      //     fontSize: 16.0);
                                      await con.send_data();
                                      CustomSnackBar.showCustomToast(message: "Boat Added Successfully".tr);
                                      con.boatname.clear();
                                      con.aboutboat.clear();
                                      con.boatprice.clear();
                                      con.maxpersons.clear();
                                      con.priceperseat.clear();
                                      con.feature1.clear();
                                      con.feature2.clear();
                                      con.feature3.clear();
                                      con.feature4.clear();
                                      con.feature5.clear();
                                      con.feature6.clear();
                                      con.feature7.clear();
                                      con.overview.clear();
                                      Get.off(Thankyou_screen());
                                      // con.send_data().whenComplete(() {
                                      //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                      //     content: Text("Boat Successfully added"),
                                      //   ));
                                      //   con.boatname.clear();
                                      //   con.aboutboat.clear();
                                      //   con.boatprice.clear();
                                      //   con.maxpersons.clear();
                                      //   con.priceperseat.clear();
                                      //   con.feature1.clear();
                                      //   con.feature2.clear();
                                      //   con.feature3.clear();
                                      //   con.feature4.clear();
                                      //   con.feature5.clear();
                                      //   con.feature6.clear();
                                      //   con.feature7.clear();
                                      //   con.overview.clear();
                                      //   Get.off(Thankyou_screen());
                                      // });
                                    }
                                  }
                                },
                                child:  Padding(
                                  padding: EdgeInsets.symmetric(vertical: 19),
                                  child:isLoading? LoadingIndicator() : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(width: 9),
                                      Text(
                                        "Next".tr,
                                        style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ])
            ]),
          ),
        ));
  }
}

class BoatAnimationWidget extends StatelessWidget {
  final double? width;
  final double? height;

  const BoatAnimationWidget({Key? key, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: Lottie.asset(
            'assets/lottie/splash_boat.json',
            // width: MediaQuery.of(context).size.width,
            height: height,
            width: width,
            repeat: true,
            fit: BoxFit.cover,
          )
          // Text("Splash Image"),
          ),
    );
  }
}