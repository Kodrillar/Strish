import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/trivia_controller.dart';
import '../gradient_button.dart';

TriviaController _myController = Get.put(TriviaController());

class TriviaQuestionNumberButton extends StatelessWidget {
  const TriviaQuestionNumberButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GradientButton(
        buttonName: '${_myController.questionIndex + 1}/13',
        font: 'Days',
        fontSize: 30,
      ),
    );
  }
}
