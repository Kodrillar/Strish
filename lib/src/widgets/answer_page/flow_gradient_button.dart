import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/trivia_controller.dart';
import '../gradient_button.dart';

TriviaController _triviaController = Get.put(TriviaController());

class FlowGradientButton extends StatelessWidget {
  const FlowGradientButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientButton(
      buttonName: 'Continue',
      onTapp: () {
        Navigator.of(context).pop();

        _triviaController.retrieveNextQuestion();
      },
    );
  }
}
