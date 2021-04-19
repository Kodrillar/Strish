import 'package:flutter/material.dart';

class BorderButton extends StatelessWidget {
  BorderButton({this.text, this.onTapp});
  final String? text;
  final void Function()? onTapp;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapp,
      child: Container(
        height: 30,
        width: 80,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 1, color: Colors.white),
            color: Colors.transparent),
        child: Center(
          child: Text(text!),
        ),
      ),
    );
  }
}
