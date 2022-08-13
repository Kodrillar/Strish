import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/trivia_controller.dart';
import '../gradient_button.dart';

TriviaController _triviaController = Get.put(TriviaController());

class TriviaQuestionNumberButton extends StatelessWidget {
  const TriviaQuestionNumberButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GradientButton(
        buttonName: '${_triviaController.questionIndex + 1}/13',
        font: 'Days',
        fontSize: 30,
      ),
    );
  }
}
