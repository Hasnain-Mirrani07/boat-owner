import 'package:boat_owner/app/global_widgets/reuseable_widget.dart';
import 'package:boat_owner/app/modeules/settings/widgets/divider.dart';
import 'package:boat_owner/app/themes/styles/textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Settings_screen extends StatefulWidget {
  @override
  State<Settings_screen> createState() => _Settings_screenState();
}

class _Settings_screenState extends State<Settings_screen> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 25, top: 50),
                  child: Text("Settings".tr, style: AppTextStyles.ktitle),
                ),
                ListTile(
                  leading: SvgPicture.asset("assets/icons/notification.svg"),
                  title:  Text("Get Updated".tr, style: AppTextStyles.kPrimaryS7W4),
                  subtitle: Text("Notifications".tr, style: AppTextStyles.kPrimaryS8W5),
                  trailing: CupertinoSwitch(
                    activeColor: Colors.blue,
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                      });
                    },
                  ),
                ),
                Divider_con(),
                Reuseable_widget("Language", "English", "language"),
                Reuseable_widget("Need help", "Help", "help"),
                Reuseable_widget("Questions & Answers", "FAQ", "faq"),
                Reuseable_widget("Privacy policy & Terms of use", "Privacy", "privacy"),
                Reuseable_widget("About App", "Version 1.01", "about_app"),
                ListTile(
                  leading: SvgPicture.asset("assets/icons/logout.svg"),
                  title: const Text(
                    "logout",
                    style: AppTextStyles.kPrimaryS8W5,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}