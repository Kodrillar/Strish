import 'package:flutter/material.dart';

import 'package:strish/src/utils/constants.dart';

class GradientButton extends StatelessWidget {
  GradientButton({this.onTapp, this.buttonName, this.font, this.fontSize});
  final void Function()? onTapp;
  final String? buttonName;
  final String? font;
  final double? fontSize;

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: kGradient,
        borderRadius: BorderRadius.circular(15),
      ),
      height: 65,
      margin: EdgeInsets.all(10),
      width: double.infinity,
      child: InkWell(
        onTap: onTapp,
        child: Center(
          child: Text(
            buttonName!,
            style: TextStyle(
                color: Colors.white, fontFamily: font, fontSize: fontSize),
          ),
        ),
      ),
    );
  }
}
