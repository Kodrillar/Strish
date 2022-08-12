import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:strish/src/model/trivia_vault_model.dart';
import 'package:strish/src/widgets/drawer_text.dart';
import 'package:strish/src/views/answer_page.dart';
import 'package:strish/src/controller/trivia_controller.dart';
import 'package:strish/src/views/references_page.dart';
import 'package:strish/src/views/welcome_page.dart';
import 'package:strish/src/widgets/gradient_button.dart';
import 'package:strish/src/widgets/border_button.dart';
import 'package:strish/src/utils/constants.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

TriviaController _myController = Get.put(TriviaController());

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
        drawer: _drawer(),
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
                      topConatiner(),
                      iconStack(),
                      helloContainer(),
                      nameContainer(),
                      questionContainer(),
                      circleDesign(),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  pictureOptions(),
                  questionNumberButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget topConatiner() {
    return Builder(
      builder: (BuildContext context) => Container(
        height: 270,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(100),
          ),
          gradient: kGradient,
        ),
      ),
    );
  }

  Widget iconStack() {
    return Positioned(
      top: 12.0,
      left: 4,
      child: Builder(
        builder: (BuildContext context) => IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          iconSize: 41.0,
          color: Colors.white,
        ),
      ),
    );
  }

  Drawer _drawer() {
    return Drawer(
      child: Builder(
        builder: (BuildContext context) => ListView(
          children: [
            Container(
              height: 250,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, top: 60, right: 130),
                child: Column(
                  children: [
                    Icon(
                      Icons.supervised_user_circle,
                      size: 60,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      userName,
                      style: kUserNameStyle,
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                gradient: kGradient,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(70),
                ),
              ),
            ),
            _myController.questionIndex > 6
                ? DrawerText(
                    text: 'References',
                    icon: Icons.ad_units_sharp,
                    onpress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => ReferencePage(),
                        ),
                      );
                    },
                  )
                : SizedBox(),
            DrawerText(
              text: 'Developer :',
              icon: Icons.developer_mode,
            ),
            Container(
              margin: EdgeInsets.only(left: 65),
              child: Row(
                children: [
                  buildSocial(
                    image: 'assets/images/git.png',
                    onTap: () {
                      _myController.openUrl('https://github.com/Kodrillar');
                    },
                  ),
                  buildSocial(
                    image: 'assets/images/facebook.png',
                    onTap: () {
                      _myController.openUrl(
                          'https://www.facebook.com/david.ipadeola.965');
                    },
                  ),
                  buildSocial(
                    image: 'assets/images/instagram.png',
                    onTap: () {
                      _myController
                          .openUrl('https://www.instagram.com/bonzerdave');
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget helloContainer() {
    return Positioned(
      left: 30,
      top: 125,
      child: Container(
        height: 70,
        child: Text(
          'hello!',
          style: kTextStyle.copyWith(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
    );
  }

  Widget nameContainer() {
    return Positioned(
      left: 30,
      top: 155,
      child: Container(
        height: 70,
        child: Text(
          userName,
          style: kUserNameStyle,
        ),
      ),
    );
  }

  Widget questionContainer() {
    return Transform.translate(
      offset: Offset(90, 220),
      child: Container(
        child: questionText(),
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

  Widget questionText() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 90.0, bottom: 10, top: 5),
      child: Center(
          child: GetX<TriviaController>(
        init: TriviaController(),
        builder: (_mycontrol) {
          return Text(
            _mycontrol.retrieveQuestion(),
            textAlign: TextAlign.center,
            style: kTextStyle.copyWith(
              color: Colors.white,
            ),
          );
        },
      )),
    );
  }

  Widget pictureOptions() {
    return Builder(
      builder: (BuildContext context) => Container(
        margin: EdgeInsets.only(top: 160),
        height: 190,
        child: Obx(
          () => ListView(
            physics: ScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: _myController
                .retrieveOptions()
                .map(
                  (imageOptions) => Hero(
                    tag: '$imageOptions',
                    child: Container(
                      margin: EdgeInsets.all(15),
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8,
                            offset: Offset(0, 4),
                            color: Colors.grey.withOpacity(.4),
                            spreadRadius: 4,
                          ),
                        ],
                        image: DecorationImage(
                            image: AssetImage(imageOptions), fit: BoxFit.cover),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (BuildContext context) {
                                return AnswerPage(
                                  image: imageOptions,
                                );
                              },
                            ),
                          );

                          _myController.scoreLogic(imageOptions);

                          //To play sound on app only, not supported for web
                          // _myController.playSound(img);
                          if (_myController.questionIndex ==
                              TriviaModel.trivia.length - 1) {
                            myAlertDialog(context);
                          }
                        },
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  buildSocial({required String image, required void Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(7),
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              offset: Offset(0, 4),
              color: kDeepPurple.withOpacity(.4),
              spreadRadius: 1,
            )
          ],
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget questionNumberButton() {
    return Obx(
      () => GradientButton(
        buttonName: '${_myController.questionIndex + 1}/13',
        font: 'Days',
        fontSize: 30,
      ),
    );
  }

  Widget circleDesign() {
    return Positioned(
      top: 550,
      left: 230,
      child: CircleAvatar(
        backgroundColor: Color(0xFF5a4dbd),
        radius: 20,
      ),
    );
  }

  myAlertDialog(context) {
    Dialog dialog = Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          gradient: kGradient,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 10,
            ),
            Obx(
              () => Center(
                child: Text(
                  'Your Score: ${_myController.userScore}/13',
                  style: kTextStyle.copyWith(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Text('Mediocre score: 8/13'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BorderButton(
                  text: 'Restart',
                  onTapp: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => Home(
                          userName: userName,
                        ),
                      ),
                    );

                    _myController.restart();
                  },
                ),
                SizedBox(
                  width: 20,
                ),
                BorderButton(
                  text: 'Quit',
                  onTapp: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => WelcomePage()));
                    _myController.restart();
                  },
                )
              ],
            )
          ],
        ),
      ),
    );

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: dialog,
      ),
    );
  }
}
