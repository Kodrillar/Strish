import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:strish/src/widgets/home_page/circle_design.dart';
import 'package:strish/src/widgets/home_page/drawer/home_drawer.dart';
import 'package:strish/src/widgets/home_page/gradient_app_bar.dart';
import 'package:strish/src/widgets/home_page/question/trivia_question_container.dart';
import 'package:strish/src/widgets/home_page/trivia_image_options.dart';
import 'package:strish/src/widgets/home_page/trivia_question_number_button.dart';

class Home extends StatelessWidget {
  Home({required this.userName});
  final String userName;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        drawer: HomeDrawer(
          userName: userName,
        ),
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: Platform.isAndroid
              ? SystemUiOverlayStyle.light
              : SystemUiOverlayStyle.dark,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      GradientAppBar(),
                      MenuIcon(),
                      GreetingText(),
                      UserNameText(userName: userName),
                      TriviaQuestionContainer(),
                      CircleVector(
                        positionTop: 550,
                        positionLeft: 230,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TriviaImageOptions(
                    userName: userName,
                  ),
                  TriviaQuestionNumberButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
