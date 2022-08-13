import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/trivia_controller.dart';

TriviaController _triviaController = Get.put(TriviaController());

class ReferenceText extends StatelessWidget {
  const ReferenceText({Key? key, required this.selectedImage})
      : super(key: key);

  final String selectedImage;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: _triviaController.retrieveReference(
              selectedImage,
            ),
            recognizer: _triviaController.launchReference(),
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: Colors.red,
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}
