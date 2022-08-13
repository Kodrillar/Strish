import 'package:flutter/material.dart';
import 'package:strish/src/widgets/home_page/question/question_text.dart';

import '../../../utils/constants.dart';

class TriviaQuestionContainer extends StatelessWidget {
  const TriviaQuestionContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(90, 220),
      child: Container(
        child: TriviaQuestionText(),
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: kGradient,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(55),
            topLeft: Radius.circular(55),
          ),
        ),
      ),
    );
  }
}
