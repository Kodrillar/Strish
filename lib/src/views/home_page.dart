import 'package:flutter/material.dart';
import 'package:strish/src/utils/constants.dart';
import 'package:strish/src/widgets/home_page/circle_design.dart';
import 'package:strish/src/widgets/home_page/gradient_app_bar.dart';
import 'package:strish/src/widgets/home_page/question/trivia_question_container.dart';
import 'package:strish/src/widgets/home_page/trivia_image_options.dart';
import 'package:strish/src/widgets/home_page/trivia_question_number_button.dart';

import '../widgets/home_page/drawer/home_drawer.dart';

class Home extends StatelessWidget {
  Home({required this.userName});
  final String userName;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: kLightPurple,
        drawer: HomeDrawer(
          userName: userName,
        ),
        body: SafeArea(
          bottom: false,
          child: Container(
            color: Colors.white,
            height: height,
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
                    height: height * 0.05,
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
