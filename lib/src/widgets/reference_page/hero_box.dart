import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class HeroBox extends StatelessWidget {
  const HeroBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              kLightPurple.withOpacity(.2),
              kDeepPurple.withOpacity(.5),
            ],
          ),
        ),
      ),
      margin: EdgeInsets.all(8),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
            image: AssetImage('assets/images/kehlani.png'), fit: BoxFit.cover),
      ),
    );
  }
}
