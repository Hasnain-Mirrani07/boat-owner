import 'package:boat_owner/app/themes/AppAssets.dart';
import 'package:flutter/material.dart';

class Camera_box extends StatelessWidget {
  const Camera_box({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: const Color(0xffF4F5F7
          )

      ),
      child: Appassets.icon_camera,
    );
  }
}
