import 'package:flutter/material.dart';

import 'package:bmi_calculator/constants.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String text;

  IconContent({this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kSpaceBox,
        Icon(
          icon,
          size: kIconSize,
        ),
        kSpaceBox,
        Text(
          text,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
