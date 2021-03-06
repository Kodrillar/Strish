import 'package:flutter/cupertino.dart';
import 'package:strish/src/widgets/drawer_text.dart';
import 'package:strish/src/views/answer_page.dart';
import 'package:strish/src/controller/controller.dart';
import 'package:strish/src/views/references.dart';
import 'package:strish/src/views/welcome_page.dart';
import 'package:strish/src/widgets/gradient_button.dart';
import 'package:strish/src/widgets/border_button.dart';
import 'package:strish/src/utils/constants.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

MyController _myController = Get.put(MyController());

class Home extends StatelessWidget {
  Home({required this.userName});
  final String userName;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          drawer: _drawer(),
          body: SingleChildScrollView(
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
          _myController.retrieveQuestionNo() > 7
              ? DrawerText(
                  text: 'References',
                  icon: Icons.ad_units_sharp,
                  onpress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => References(),
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
                buildSocial('assets/images/git.png', () {
                  _myController.openUrl('https://github.com/Kodrillar');
                }),
                buildSocial('assets/images/facebook.png', () {
                  _myController
                      .openUrl('https://www.facebook.com/david.ipadeola.965');
                }),
                buildSocial('assets/images/instagram.png', () {
                  _myController.openUrl('https://www.instagram.com/kold_tunez');
                })
              ],
            ),
          ),
        ],
      ),
    ));
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
          child: GetX<MyController>(
        init: MyController(),
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
                    (img) => Hero(
                      tag: '$img',
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
                              image: AssetImage(img), fit: BoxFit.cover),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              CupertinoPageRoute(
                                builder: (BuildContext context) {
                                  return AnswerPage(
                                    image: img,
                                  );
                                },
                              ),
                            );
                            _myController.scoreLogic(img);

                            //To play sound on app only, not supported for web
                            // _myController.playSound(img);
                            if (_myController.retrieveQuestionNo() == 13) {
                              return myAlertDialog(context);
                            }
                          },
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          )),
    );
  }

  buildSocial(String image, void Function() onTapp) {
    return GestureDetector(
      onTap: onTapp,
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
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget questionNumberButton() {
    return Obx(
      () => GradientButton(
        buttonName: '${_myController.retrieveQuestionNo()}/13',
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
                  'Your Score: ${_myController.retrieveScore()}/13',
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
