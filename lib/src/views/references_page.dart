import 'package:flutter/material.dart';

import 'package:strish/src/utils/constants.dart';

import 'package:strish/src/model/reference_model.dart';
import 'package:strish/src/widgets/reference_page/app_bar.dart';
import 'package:strish/src/widgets/reference_page/hero_image_box.dart';

class ReferencePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightPurple,
      appBar: ReferenceAppBar(),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            HeroImageBox(),
            for (var reference in ReferenceModel.references)
              ReferenceBar(
                onPressed: reference.onPressed,
                name: reference.name,
              ),
          ],
        ),
      ),
    );
  }
}

class ReferenceBar extends StatelessWidget {
  ReferenceBar({required this.onPressed, required this.name});
  final void Function() onPressed;
  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(5),
        height: 60,
        width: double.infinity,
        child: Card(
          child: Center(
            child: Text(
              name,
              style: kTextStyle.copyWith(
                fontFamily: 'Days',
                color: kLightPurple,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
