import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:strish/src/widgets/home_page/social_media_box.dart';

import '../../../controller/trivia_controller.dart';
import '../../../utils/constants.dart';
import '../../../views/references_page.dart';
import 'drawer_text.dart';

TriviaController _triviaController = Get.put(TriviaController());

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    Key? key,
    required this.userName,
  }) : super(key: key);
  final String userName;

  @override
  Widget build(BuildContext context) {
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
                      style: kUserNameTextStyle,
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
            _triviaController.questionIndex > 6
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
                  SocialMediaBox(
                    logoName: 'assets/images/git.png',
                    onPressed: () {
                      _triviaController.openUrl('https://github.com/Kodrillar');
                    },
                  ),
                  SocialMediaBox(
                    logoName: 'assets/images/facebook.png',
                    onPressed: () {
                      _triviaController.openUrl(
                          'https://www.facebook.com/david.ipadeola.965');
                    },
                  ),
                  SocialMediaBox(
                    logoName: 'assets/images/instagram.png',
                    onPressed: () {
                      _triviaController
                          .openUrl('https://www.instagram.com/Kodrillar');
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
}
