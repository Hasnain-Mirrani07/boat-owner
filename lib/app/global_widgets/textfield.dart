import 'package:boat_owner/app/global_widgets/reuseable_button.dart';
import 'package:boat_owner/app/themes/styles/textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:boat_owner/services/firebase_reistrstiong.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../themes/AppAssets.dart';
import '../themes/AppColors.dart';

class Textfield extends StatefulWidget {
  Textfield(@required this.conOne,
      this.conTwo);


  TextEditingController conOne;
  TextEditingController conTwo;

  @override
  State<Textfield> createState() => _TextfieldState();
}

class _TextfieldState extends State<Textfield> {
  final formGlobalKey = GlobalKey<FormState>();

  bool _obsuretext = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formGlobalKey,

      child: Column(
        children: [

        ],
      ),
    );
  }
}

class Textfield2 extends StatelessWidget {
  Textfield2(this.label, this.controller);

  var label;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.1,
      height: 56,
      child: TextField(
        controller: controller,
        maxLines: 6,
        decoration: InputDecoration(
            hintText: label,
            hintStyle: AppTextStyles.kPrimaryS2W4,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: AppColors.S_text),
              borderRadius: BorderRadius.circular(13),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: AppColors.S_text),
              borderRadius: BorderRadius.circular(13),
            )),
      ),
    );
  }
}
