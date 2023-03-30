import 'package:boat_owner/app/global_widgets/camer_box.dart';
import 'package:boat_owner/app/global_widgets/textfield.dart';
import 'package:boat_owner/app/themes/AppAssets.dart';
import 'package:boat_owner/app/themes/AppColors.dart';
import 'package:boat_owner/app/themes/AppDimensions.dart';
import 'package:boat_owner/app/themes/styles/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Certififcate_page extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 17, top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.arrow_back,
                color: AppColors.icon_clr,
                size: AppDimensions.kXLargeSize,
              ),
              const SizedBox(height: 12),
              Text("Certificates".tr, style: AppTextStyles.ktitle),
              const SizedBox(height: 17),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        CircleAvatar(
                            radius: 15,
                            backgroundColor: const Color(0xff3E5481),
                            child: Text("1".tr, style: const TextStyle(color: Colors.white, fontSize: 12))),
                        const SizedBox(height: 19),
                        Appassets.icon_certificate
                      ],
                    ),
                  ),
                  Expanded(flex: 5, child: Textfield2("Title of Certifications".tr, _controller)),
                ],
              ),
              Row(
                children: [Expanded(child: Camera_box())],
              ),
              SizedBox(height: 17),
              Container(
                margin: EdgeInsets.only(left: 11),
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(17), border: Border.all(color: AppColors.border)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add, color: AppColors.title_clr, size: 27),
                      SizedBox(width: 5.5),
                      Text(
                        "Certificate".tr,
                        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: AppColors.title_clr),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}