import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:strish/src/utils/constants.dart';

import 'src/app.dart';

void main() {
  runZonedGuarded(() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: kLightPurple,
      ),
    );

    runApp(StrishApp());

    FlutterError.onError = (FlutterErrorDetails errorDetails) {
      FlutterError.presentError(errorDetails);
    };

    ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
      return Container(
        color: kErrorColor,
        child: Center(
          child: Text(
            'Client Error! Restart App',
          ),
        ),
      );
    };
  }, ((error, stack) {
    debugPrint(error.toString());
  }));
}
