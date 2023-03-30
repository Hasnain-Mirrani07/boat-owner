import 'dart:io';

import 'package:boat_owner/app/bottomapp.dart';
import 'package:boat_owner/app/global_widgets/reuseable_button.dart';
import 'package:boat_owner/app/modeules/add_boat/add_boat_step_2.dart';
import 'package:boat_owner/app/themes/AppAssets.dart';
import 'package:boat_owner/app/themes/AppColors.dart';
import 'package:boat_owner/app/themes/styles/textstyle.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:image_picker/image_picker.dart';

import 'controller/step_1controller.dart';

class Add_boatStep1 extends StatefulWidget {
  @override
  State<Add_boatStep1> createState() => _Add_boatStep1State();
}

class _Add_boatStep1State extends State<Add_boatStep1> {
  final formGlobalKey = GlobalKey<FormState>();

  int i = 0;
  int i1 = 1;
  int i2 = 2;
  int i3 = 3;
  int i4 = 4;

  final _picker = ImagePicker();

  final con = Get.put(Step_1Controller());

  void showToast() {
    setState(() {
      v++;
      visible[v] = true;

      print(v);
    });
  }

  var visible = [
    false,
    false,
    false,
    false,
    false,
  ];
  int v = 0;

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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 22,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Get.to(Home());
                            },
                            child: Text("Cancel".tr, style: AppTextStyles.kPrimaryS9W5)),
                        RichText(
                          text: TextSpan(
                              text: '1/'.tr,
                              style: const TextStyle(color: AppColors.title_clr, fontSize: 17, fontWeight: FontWeight.w700),
                              children: [
                                TextSpan(
                                    text: ' ' + '3'.tr,
                                    style: TextStyle(fontSize: 17, color: Colors.grey, fontWeight: FontWeight.w700)),
                              ]),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    RichText(
                      text: TextSpan(text: 'Add Boat Photo'.tr, style: AppTextStyles.kPrimaryS7W5, children: <TextSpan>[
                        TextSpan(text: '  (up to 12)'.tr, style: AppTextStyles.kPrimaryS7W4),
                      ]),
                    ),
                    const SizedBox(height: 12),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          i == 0
                              ? GestureDetector(
                                  onTap: () {
                                    getImage();
                                  },
                                  child: DottedBorder(
                                    borderType: BorderType.RRect,
                                    radius: Radius.circular(14),
                                    dashPattern: [7, 7],
                                    color: Colors.grey,
                                    strokeWidth: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: Container(width: 47, height: 47, child: Appassets.image),
                                    ),
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(14),
                                  child: Image.file(
                                    con.image!,
                                    fit: BoxFit.cover,
                                    width: 68,
                                    height: 68,
                                  ),
                                ),
                          const SizedBox(
                            width: 18,
                          ),
                          Visibility(
                            visible: visible[1],
                            child: i1 == 1
                                ? GestureDetector(
                                    onTap: () {
                                      getImage2();
                                    },
                                    child: DottedBorder(
                                      borderType: BorderType.RRect,
                                      radius: Radius.circular(14),
                                      dashPattern: [7, 7],
                                      color: Colors.grey,
                                      strokeWidth: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.all(7.0),
                                        child: Container(width: 47, height: 47, child: Appassets.image),
                                      ),
                                    ),
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(14),
                                    child: Image.file(
                                      con.image2!,
                                      fit: BoxFit.cover,
                                      width: 68,
                                      height: 68,
                                    ),
                                  ),
                          ),
                          const SizedBox(
                            width: 18,
                          ),
                          Visibility(
                            visible: visible[2],
                            child: i2 == 2
                                ? GestureDetector(
                                    onTap: () {
                                      getImage3();
                                    },
                                    child: DottedBorder(
                                      borderType: BorderType.RRect,
                                      radius: Radius.circular(14),
                                      dashPattern: [7, 7],
                                      color: Colors.grey,
                                      strokeWidth: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.all(7.0),
                                        child: Container(width: 47, height: 47, child: Appassets.image),
                                      ),
                                    ),
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(14),
                                    child: Image.file(
                                      con.image3!,
                                      fit: BoxFit.cover,
                                      width: 68,
                                      height: 68,
                                    ),
                                  ),
                          ),
                          const SizedBox(
                            width: 18,
                          ),
                          Visibility(
                            visible: visible[3],
                            child: i3 == 3
                                ? GestureDetector(
                                    onTap: () {
                                      getImage4();
                                    },
                                    child: DottedBorder(
                                      borderType: BorderType.RRect,
                                      radius: Radius.circular(14),
                                      dashPattern: [7, 7],
                                      color: Colors.grey,
                                      strokeWidth: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.all(7.0),
                                        child: Container(width: 47, height: 47, child: Appassets.image),
                                      ),
                                    ),
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(14),
                                    child: Image.file(
                                      con.image4!,
                                      fit: BoxFit.cover,
                                      width: 68,
                                      height: 68,
                                    ),
                                  ),
                          ),
                          const SizedBox(
                            width: 18,
                          ),
                          Visibility(
                            visible: visible[4],
                            child: i4 == 4
                                ? GestureDetector(
                                    onTap: () {
                                      getImage5();
                                    },
                                    child: DottedBorder(
                                      borderType: BorderType.RRect,
                                      radius: Radius.circular(14),
                                      dashPattern: [7, 7],
                                      color: Colors.grey,
                                      strokeWidth: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.all(7.0),
                                        child: Container(width: 47, height: 47, child: Appassets.image),
                                      ),
                                    ),
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(14),
                                    child: Image.file(
                                      con.image5!,
                                      fit: BoxFit.cover,
                                      width: 68,
                                      height: 68,
                                    ),
                                  ),
                          ),
                          const SizedBox(
                            width: 18,
                          ),
                          GestureDetector(
                            onTap: showToast,
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(14),
                              dashPattern: const [7, 7],
                              color: Colors.grey,
                              strokeWidth: 2,
                              child: const Padding(
                                padding: EdgeInsets.all(9.0),
                                child: Icon(Icons.add, color: Colors.black, size: 36),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text("Boat Name".tr, style: AppTextStyles.kPrimaryS7W5),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter'.tr + 'Boat Name'.tr.toLowerCase();
                          }
                          return null;
                        },
                        controller: con.boatname,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: 'enter'.tr.capitalizeFirst ?? "" + "Boat Name".tr.toLowerCase(),
                            hintStyle: AppTextStyles.kPrimaryS2W4,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: AppColors.S_text),
                              borderRadius: BorderRadius.circular(13),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: AppColors.S_text),
                              borderRadius: BorderRadius.circular(13),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: AppColors.S_text),
                              borderRadius: BorderRadius.circular(13),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width: 1, color: AppColors.S_text),
                              borderRadius: BorderRadius.circular(13),
                            )),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text("About Boat".tr, style: AppTextStyles.kPrimaryS7W5),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.1,
                      height: 196,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter About your Boat'.tr;
                          }
                          return null;
                        },
                        controller: con.aboutboat,
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
                    RichText(
                      text: TextSpan(text: 'Boat Price (Full Boat) '.tr, style: AppTextStyles.kPrimaryS7W5, children: <TextSpan>[
                        TextSpan(text: '(Per Hour)'.tr, style: AppTextStyles.kPrimaryS11W4),
                      ]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Boat Price'.tr;
                          }
                          return null;
                        },
                        controller: con.boatprice,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "Enter price".tr,
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
                    const SizedBox(height: 26),
                    Text("Max. Persons".tr, style: AppTextStyles.kPrimaryS7W5),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Max. Persons'.tr;
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        controller: con.maxpersons,
                        decoration: InputDecoration(
                            hintText: "Enter number".tr,
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
                    Row(
                      children: [
                        Transform.scale(
                          scale: 1.6,
                          child: Checkbox(
                            side: BorderSide(width: 0.5, color: AppColors.Sdark_blue),
                            activeColor: AppColors.Sdark_blue,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            value: this.con.rentbyseat,
                            onChanged: (bool? value) {
                              setState(() {
                                con.rentbyseat = value!;
                              });
                            },
                          ),
                        ), //
                        SizedBox(width: 10),
                        Text("Available as rent by seat".tr, style: AppTextStyles.kPrimaryS11W5),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Visibility(
                      visible: con.rentbyseat,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: 'Boat Price (Per Seat)'.tr + ' ',
                                style: AppTextStyles.kPrimaryS7W5,
                                children: <TextSpan>[
                                  TextSpan(text: '(Per Hour)'.tr, style: AppTextStyles.kPrimaryS11W4),
                                ]),
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.1,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: con.priceperseat,
                              decoration: InputDecoration(
                                  hintText: "Enter Price".tr,
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
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Reuseable_button("Next".tr, AppColors.Sdark_blue, null, () {
                      if (formGlobalKey.currentState!.validate()) {
                        formGlobalKey.currentState!.save();
                        if (con.image == null) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Please Select  Image".tr),
                          ));
                        } else {
                          Get.to(Add_boat_step_2());
                        }
                      }
                    }),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getImage() async {
    final XFile? pickedImage = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );
    if (pickedImage != null) {
      setState(() {
        i = 1;

        con.image = File(pickedImage.path);
      });
    }
  }

  Future<void> getImage2() async {
    try {
      final XFile? pickedImage = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
      );
      if (pickedImage != null) {
        setState(() {
          i1 = 2;

          con.image2 = File(pickedImage.path);
        });
      }
    } catch (e) {
      print("my errorrrrr");
      print(e);
    }
  }

  Future<void> getImage3() async {
    final XFile? pickedImage = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );
    if (pickedImage != null) {
      setState(() {
        i2 = 3;

        con.image3 = File(pickedImage.path);
      });
    }
  }

  Future<void> getImage4() async {
    final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        i3 = 4;

        con.image4 = File(pickedImage.path);
      });
    }
  }

  Future<void> getImage5() async {
    final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        i4 = 5;

        con.image5 = File(pickedImage.path);
      });
    }
  }
}