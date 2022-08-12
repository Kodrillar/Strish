import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:strish/src/utils/constants.dart';

import 'src/app.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: kLightPurple,
    ),
  );

  runApp(MyApp());
}
