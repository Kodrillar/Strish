import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/trivia_controller.dart';
import '../../model/trivia_vault_model.dart';
import '../../views/answer_page.dart';
import '../trivia_alert_dialog.dart';

TriviaController _myController = Get.put(TriviaController());

class TriviaImageOptions extends StatelessWidget {
  const TriviaImageOptions({
    Key? key,
    required this.userName,
  }) : super(key: key);

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                                selectedImage: imageOptions,
                              );
                            },
                          ),
                        );

                        _myController.incrementUserScore(imageOptions);

                        //To play sound on app only, not supported for web
                        // _myController.playSound(img);
                        if (_myController.questionIndex ==
                            TriviaModel.trivia.length - 1) {
                          showTriviaCompleteDialog(context);
                        }
                      },
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  showTriviaCompleteDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: TriviaCompleteAlertDialog(
          userName: userName,
        ),
      ),
    );
  }
}
