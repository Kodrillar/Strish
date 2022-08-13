import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class GradientAppBar extends StatelessWidget {
  const GradientAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(100),
        ),
        gradient: kGradient,
      ),
    );
  }
}

class MenuIcon extends StatelessWidget {
  const MenuIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 12.0,
      left: 4,
      child: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        iconSize: 41.0,
        color: Colors.white,
      ),
    );
  }
}

class GreetingText extends StatelessWidget {
  const GreetingText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}

class UserNameText extends StatelessWidget {
  const UserNameText({
    Key? key,
    required this.userName,
  }) : super(key: key);
  final String userName;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 30,
      top: 155,
      child: Container(
        height: 70,
        child: Text(
          userName,
          style: kUserNameTextStyle,
        ),
      ),
    );
  }
}
