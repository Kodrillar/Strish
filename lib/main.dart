import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:strish/src/utils/constants.dart';
import 'package:get/get.dart';
import 'package:strish/src/views/welcome_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: kLightPurple,
    ),
  );

  runApp(MyApp());
}

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
