import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../resources/strings_manager.dart';

Widget termsAndConditions(BuildContext context) {
 return SizedBox(
    width: MediaQuery.of(context).size.width * .6,
    child: RichText(
      text: const TextSpan(
        text: StringsManager.byConnectingYouAgree,
        style: TextStyle(color: ColorManager.grey, fontSize: 14, height: 1.3),
        children: <TextSpan>[
          TextSpan(
            text: ' ${StringsManager.termsAndCondition}',
            style: TextStyle(
                color: ColorManager.black,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}
