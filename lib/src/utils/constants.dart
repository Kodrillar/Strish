import 'package:flutter/material.dart';

const Color kLightPurple = Color(0xFFBD7DDE);
const Color kErrorColor = Colors.red;
const Color kDeepPurple = Color(0xFF5a4dbd);
const Gradient kGradient = LinearGradient(
  stops: [-.1, .8],
  colors: [
    kLightPurple,
    kDeepPurple,
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

const kTextStyle = TextStyle(
  fontSize: 16,
  color: Colors.white,
  fontFamily: 'Raleway',
);

const kUserNameTextStyle = TextStyle(
  fontFamily: 'Days',
  fontSize: 30,
  color: Colors.white,
);
