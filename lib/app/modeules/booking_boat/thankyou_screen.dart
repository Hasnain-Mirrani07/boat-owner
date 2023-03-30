import 'package:boat_owner/app/bottomapp.dart';
import 'package:boat_owner/app/global_widgets/reuseable_button.dart';
import 'package:boat_owner/app/themes/styles/textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../themes/AppColors.dart';
import '../../themes/AppDimensions.dart';

class Thankyou_screen extends StatelessWidget {
  const Thankyou_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 51.0, horizontal: 20),
                  child: const Align(
                      alignment: FractionalOffset.topLeft,
                      child: Icon(Icons.close, color: AppColors.icon_clr, size: AppDimensions.kXLargeSize)),
                ),
                Text("Boat Added".tr, style: AppTextStyles.ktitle),
                SizedBox(height: 11),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text("Your boat has been uploaded, you can see it on your profile".tr,
                      textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 100.0),
                  child: Image.asset("assets/image 7.png"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Reuseable_button("View Profile".tr, AppColors.Sdark_blue, null, () {
                    Get.to(Home());
                  }),
                ),
                SizedBox(height: 15)
              ],
            ),
          ],
        ),
      ),
    );
  }
}