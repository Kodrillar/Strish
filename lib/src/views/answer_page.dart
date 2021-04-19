import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:strish/src/widgets/gradient_button.dart';
import 'package:strish/src/utils/constants.dart';
import 'package:strish/src/controller/controller.dart';
import 'package:get/get.dart';

MyController _myController = Get.put(MyController());

class AnswerPage extends StatelessWidget {
  AnswerPage({required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: myAppBar(),
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
                      answerPicture(),
                      reference(),
                      continueButton(),
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
      ),
    );
  }

  myAppBar() {
    return AppBar(
      backgroundColor: kLightPurple,
      elevation: 0.0,
      leading: Builder(
        builder: (BuildContext context) => IconButton(
          onPressed: () {
            Navigator.pop(context);
            _myController.scoreLogic(image);
            _myController.retrieveNextQuestion();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
    );
  }

  Transform imageAvatar() {
    return Transform.translate(
      offset: Offset(0, -40),
      child: Hero(
        tag: '$image',
        child: Container(
          height: 130,
          width: 140,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
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

  answerPicture() {
    return Container(
      height: 142,
      width: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            _myController.retrieveImageAnswer(image),
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  reference() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: _myController.retrieveReference(image),
            recognizer: _myController.launchReference(),
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: Colors.red,
              fontSize: 30,
            ),
          )
        ],
      ),
    );
  }

  continueButton() {
    return Builder(
      builder: (BuildContext context) => GradientButton(
        buttonName: 'Continue',
        onTapp: () {
          Navigator.of(context).pop();

          _myController.retrieveNextQuestion();
        },
      ),
    );
  }
}
