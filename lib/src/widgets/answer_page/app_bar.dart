import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/trivia_controller.dart';
import '../../utils/constants.dart';

TriviaController _triviaController = Get.put(TriviaController());

class AnswerPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AnswerPageAppBar({
    Key? key,
    required this.selectedImage,
  }) : super(key: key);

  final String selectedImage;

  @override
  Size get preferredSize => Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kLightPurple,
      elevation: 0.0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
          _triviaController.incrementUserScore(selectedImage);
          _triviaController.retrieveNextQuestion();
        },
        icon: Icon(Icons.arrow_back_ios),
      ),
    );
  }
}
