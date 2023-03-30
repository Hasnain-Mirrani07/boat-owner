import 'package:boat_owner/app/global_widgets/big_divider.dart';
import 'package:boat_owner/app/modeules/add_boat/add_boat_step_3.dart';
import 'package:boat_owner/app/themes/AppColors.dart';
import 'package:boat_owner/app/themes/styles/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../bottomapp.dart';
import '../../global_widgets/visibility.dart';
import 'controller/step_1controller.dart';

class Add_boat_step_2 extends StatefulWidget {
  @override
  State<Add_boat_step_2> createState() => _Add_boat_step_2State();
}

class _Add_boat_step_2State extends State<Add_boat_step_2> {
  final con = Get.put(Step_1Controller());

  void visibility() {
    setState(() {
      con.index++;
      con.visible[con.index] = true;

      print(con.index);
    });
  }

  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        body: Form(
          key: formGlobalKey,
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 22),
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
                              text: '2/'.tr,
                              style: const TextStyle(color: AppColors.title_clr, fontSize: 17, fontWeight: FontWeight.w700),
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' ' + '3'.tr,
                                  style: TextStyle(fontSize: 17, color: Colors.grey, fontWeight: FontWeight.w700),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 31.0),
                    child: Text("Facilitates".tr, style: AppTextStyles.kPrimaryS10W1),
                  ),
                  const SizedBox(height: 27),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Transform.scale(
                              scale: 1.6,
                              child: Checkbox(
                                side: BorderSide(width: 0.5, color: AppColors.Sdark_blue),
                                activeColor: AppColors.Sdark_blue,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                value: this.con.facilityone,
                                onChanged: (bool? value) {
                                  setState(() {
                                    con.facilityone = value!;
                                  });
                                },
                              ),
                            ), //

                            SizedBox(width: 14),
                            Text(con.text1, style: AppTextStyles.kPrimaryS11W5)
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Transform.scale(
                              scale: 1.6,
                              child: Checkbox(
                                side: BorderSide(width: 0.5, color: AppColors.Sdark_blue),
                                activeColor: AppColors.Sdark_blue,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                value: this.con.facilitytwo,
                                onChanged: (bool? value) {
                                  setState(() {
                                    con.facilitytwo = value!;
                                  });
                                },
                              ),
                            ), //
                            SizedBox(width: 14),
                            Text(con.text2, style: AppTextStyles.kPrimaryS11W5)
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Transform.scale(
                              scale: 1.6,
                              child: Checkbox(
                                side: BorderSide(width: 0.5, color: AppColors.Sdark_blue),
                                activeColor: AppColors.Sdark_blue,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                value: this.con.facilitythree,
                                onChanged: (bool? value) {
                                  setState(() {
                                    con.facilitythree = value!;
                                  });
                                },
                              ),
                            ), //

                            SizedBox(width: 10),
                            Text(con.text3, style: AppTextStyles.kPrimaryS11W5)
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Transform.scale(
                              scale: 1.6,
                              child: Checkbox(
                                side: BorderSide(width: 0.5, color: AppColors.Sdark_blue),
                                activeColor: AppColors.Sdark_blue,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                value: this.con.facilityfour,
                                onChanged: (bool? value) {
                                  setState(() {
                                    con.facilityfour = value!;
                                  });
                                },
                              ),
                            ), //
                            SizedBox(width: 14),
                            Text(con.text4, style: AppTextStyles.kPrimaryS11W5)
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(margin: EdgeInsets.only(top: 22, bottom: 29), width: double.infinity, height: 7, color: Color(0xffF4F5F7)),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text("Features".tr, style: AppTextStyles.kPrimaryS10W1),
                  ),
                  const SizedBox(height: 26),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: SvgPicture.asset(
                          'assets/icons/icon_1.svg',
                        )),
                        Expanded(
                          flex: 6,
                          child: SizedBox(
                            height: 62,
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter'.tr + 'Features'.tr;
                                }
                                return null;
                              },
                              controller: con.feature1,
                              maxLines: 6,
                              decoration: InputDecoration(
                                  hintText: "Enter feature".tr,
                                  hintStyle: AppTextStyles.kPrimaryS2W4,
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(width: 1, color: AppColors.S_text),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(width: 1, color: AppColors.S_text),
                                    borderRadius: BorderRadius.circular(16),
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
                        )
                      ],
                    ),
                  ),
                  con.visible[0] == false ? SizedBox(height: 24) : SizedBox(height: 0),
                  visible(i: con.visible[0], controller: con.feature2),
                  con.visible[0] == false ? SizedBox(height: 0) : SizedBox(height: 24),
                  visible(i: con.visible[1], controller: con.feature3),
                  con.visible[1] == false ? SizedBox(height: 0) : SizedBox(height: 24),
                  visible(i: con.visible[2], controller: con.feature4),
                  con.visible[2] == false ? SizedBox(height: 0) : SizedBox(height: 24),
                  visible(i: con.visible[3], controller: con.feature5),
                  con.visible[3] == false ? SizedBox(height: 0) : SizedBox(height: 24),
                  visible(i: con.visible[4], controller: con.feature6),
                  con.visible[4] == false ? SizedBox(height: 0) : SizedBox(height: 24),
                  visible(i: con.visible[5], controller: con.feature7),
                  con.visible[5] == false ? SizedBox(height: 0) : SizedBox(height: 24),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: visibility,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      width: double.infinity,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), border: Border.all(color: AppColors.border)),
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.add, color: AppColors.title_clr, size: 25),
                          const SizedBox(width: 16),
                          Text("Feature".tr, style: AppTextStyles.kPrimaryS12W1),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),
                  const Big_divider(),
                  const SizedBox(height: 22),
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
                                  const SizedBox(width: 9),
                                  Text(
                                    "Back".tr,
                                    style: const TextStyle(color: AppColors.Proyel_blue, fontSize: 15, fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17.0),
                              )),
                              backgroundColor: MaterialStateProperty.all<Color>(AppColors.Sdark_blue),
                            ),
                            onPressed: () {
                              if (formGlobalKey.currentState!.validate()) {
                                formGlobalKey.currentState!.save();

                                if (con.facilityone == false &&
                                    con.facilitytwo == false &&
                                    con.facilitythree == false &&
                                    con.facilityfour == false) {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text("Please select one of facilities".tr),
                                  ));
                                } else {
                                  Get.to(Add_boat_step3());
                                }
                              }
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 19),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(width: 9),
                                  Text("Next".tr,
                                      style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}