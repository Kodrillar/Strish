import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:strish/src/widgets/border_button.dart';

import '../controller/trivia_controller.dart';
import '../utils/constants.dart';
import '../views/home_page.dart';
import '../views/welcome_page.dart';

TriviaController _triviaController = Get.put(TriviaController());

class TriviaCompleteAlertDialog extends StatelessWidget {
  const TriviaCompleteAlertDialog({
    Key? key,
    required this.userName,
  }) : super(key: key);

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Dialog(
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
                  'Your Score: ${_triviaController.userScore}/13',
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

                    _triviaController.restartTrivia();
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
                    _triviaController.restartTrivia();
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
