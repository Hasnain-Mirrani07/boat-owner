import 'package:boat_owner/app/global_widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../modeules/add_boat/controller/step_1controller.dart';

class visible extends StatelessWidget {
  visible({
    Key? key,
    required this.i,
    required TextEditingController controller,
  })  : _controller = controller,
        super(key: key);

  final bool i;
  final TextEditingController _controller;
  final con = Get.put(Step_1Controller());

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: i,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26.0),
        child: Row(
          children: [
            Expanded(
                child: SvgPicture.asset(
              'assets/icons/icon_1.svg',
            )),
            Expanded(flex: 6, child: Textfield2("Enter feature", _controller))
          ],
        ),
      ),
    );
  }
}
