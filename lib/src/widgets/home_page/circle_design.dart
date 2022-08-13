import 'package:flutter/material.dart';

class CircleVector extends StatelessWidget {
  const CircleVector({
    Key? key,
    this.positionLeft,
    this.positionTop,
  }) : super(key: key);

  final double? positionLeft;
  final double? positionTop;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: positionTop,
      left: positionLeft,
      child: CircleAvatar(
        backgroundColor: Color(0xFF5a4dbd),
        radius: 20,
      ),
    );
  }
}
