import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class SocialMediaBox extends StatelessWidget {
  const SocialMediaBox({
    Key? key,
    required this.logoName,
    required this.onPressed,
  }) : super(key: key);
  final String logoName;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(7),
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              offset: Offset(0, 4),
              color: kDeepPurple.withOpacity(.4),
              spreadRadius: 1,
            )
          ],
          image: DecorationImage(
            image: AssetImage(logoName),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
