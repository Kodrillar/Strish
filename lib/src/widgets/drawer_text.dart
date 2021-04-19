import 'package:flutter/material.dart';
import 'package:strish/src/utils/constants.dart';

class DrawerText extends StatelessWidget {
  DrawerText({required this.text, required this.icon, this.onpress});

  final String? text;
  final IconData? icon;
  final void Function()? onpress;
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: GestureDetector(
          onTap: onpress,
          child: ListTile(
            title: Text(
              text!,
              style: kTextStyle,
            ),
            leading: Container(
              height: 35,
              width: 35,
              child: Icon(
                icon,
                color: kDeepPurple,
              ),
              decoration: BoxDecoration(
                color: kLightPurple.withOpacity(.4),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ))
      ],
    );
  }
}
