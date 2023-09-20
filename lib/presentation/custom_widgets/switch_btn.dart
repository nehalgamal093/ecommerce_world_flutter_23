import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/strings_manager.dart';

Widget switchBtn(bool value,Function onChanged) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        StringsManager.rememberMe,
        style: TextStyle(
            color: ColorManager.black,
            fontSize: 14,
            fontWeight: FontWeight.bold),
      ),
      Switch(
          activeTrackColor: ColorManager.green,
          value: value,
          onChanged: (val) {}),
    ],
  );
}
