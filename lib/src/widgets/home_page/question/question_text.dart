import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/trivia_controller.dart';
import '../../../utils/constants.dart';

class TriviaQuestionText extends StatelessWidget {
  const TriviaQuestionText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 90.0, bottom: 10, top: 5),
      child: Center(
          child: GetX<TriviaController>(
        init: TriviaController(),
        builder: (_triviaController) {
          return Text(
            _triviaController.retrieveQuestion(),
            textAlign: TextAlign.center,
            style: kTextStyle.copyWith(
              color: Colors.white,
            ),
          );
        },
      )),
    );
  }
}
