import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'utils/constants.dart';
import 'views/welcome_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText2: TextStyle(fontFamily: 'Raleway', color: Colors.white),
          bodyText1: TextStyle(
            fontFamily: 'Raleway',
          ),
        ),
        colorScheme: Theme.of(context).colorScheme.copyWith(
              secondary: kLightPurple,
            ),
        primaryColor: Colors.amber,
      ),
      home: WelcomePage(),
      debugShowCheckedModeBanner: false,
      title: 'Strish',
    );
  }
}
