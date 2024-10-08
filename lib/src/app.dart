import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'utils/constants.dart';
import 'views/welcome_page.dart';

class StrishApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            fontFamily: 'Raleway',
            color: Colors.white,
          ),
          bodyLarge: TextStyle(
            fontFamily: 'Raleway',
          ),
        ),
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: kDeepPurple,
              secondary: kLightPurple,
            ),
        // primaryColor: kDeepPurple,
      ),
      home: WelcomePage(),
      debugShowCheckedModeBanner: false,
      title: 'Strish',
    );
  }
}
