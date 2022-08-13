import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/trivia_controller.dart';

TriviaController _triviaController = Get.put(TriviaController());

class TriviaAnswerPicture extends StatelessWidget {
  const TriviaAnswerPicture({
    Key? key,
    required this.selectedImage,
  }) : super(key: key);

  final String selectedImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 142,
      width: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            _triviaController.retrieveImageAnswer(selectedImage),
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
