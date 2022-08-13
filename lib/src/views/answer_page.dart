import 'package:flutter/material.dart';
import 'package:strish/src/utils/constants.dart';
import 'package:strish/src/widgets/answer_page/answer_picture.dart';
import 'package:strish/src/widgets/answer_page/app_bar.dart';
import 'package:strish/src/widgets/answer_page/flow_gradient_button.dart';
import 'package:strish/src/widgets/answer_page/reference_text.dart';

class AnswerPage extends StatelessWidget {
  AnswerPage({required this.selectedImage});

  final String selectedImage;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AnswerPageAppBar(selectedImage: selectedImage),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  kLightPurple,
                  kDeepPurple,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(
                  top: 60,
                  left: 10,
                  right: 10,
                  bottom: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    imageAvatar(),
                    TriviaAnswerPicture(selectedImage: selectedImage),
                    ReferenceText(
                      selectedImage: selectedImage,
                    ),
                    FlowGradientButton()
                  ],
                ),
                height: 450,
                width: 340,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Transform imageAvatar() {
    return Transform.translate(
      offset: Offset(0, -40),
      child: Hero(
        tag: '$selectedImage',
        child: Container(
          height: 130,
          width: 140,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(selectedImage),
              fit: BoxFit.cover,
            ),
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: 8,
            ),
          ),
        ),
      ),
    );
  }
}
