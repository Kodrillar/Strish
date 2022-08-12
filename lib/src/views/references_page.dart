import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:strish/src/utils/constants.dart';
import 'package:strish/src/controller/trivia_controller.dart';
import 'package:strish/src/model/reference_model.dart';
import 'package:strish/src/widgets/reference_page/app_bar.dart';
import 'package:strish/src/widgets/reference_page/hero_box.dart';

TriviaController _controller = Get.put(TriviaController());

class ReferencePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: ReferenceAppBar(),
        body: ListView(
          children: [
            HeroBox(),
            for (var ref in references)
              BuildRefs(onTapp: ref.onTapp!, name: ref.name!),
          ],
        ),
      ),
    );
  }
}

class BuildRefs extends StatelessWidget {
  BuildRefs({required this.onTapp, required this.name});
  final void Function() onTapp;
  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapp,
      child: Container(
        margin: EdgeInsets.all(5),
        height: 60,
        width: double.infinity,
        child: Card(
          child: Center(
            child: Text(
              name,
              style: kTextStyle.copyWith(fontFamily: 'Days'),
            ),
          ),
        ),
      ),
    );
  }
}

List<Reference> references = [
  Reference(
      name: 'Bill Gate',
      onTapp: () {
        _controller.openUrl('https://en.wikipedia.org/wiki/Bill_Gate');
      }),
  Reference(
      name: 'Jeff Bezos',
      onTapp: () {
        _controller.openUrl('https://en.wikipedia.org/wiki/Jeff_Bezos');
      }),
  Reference(
      name: 'Elon Musk',
      onTapp: () {
        _controller.openUrl('https://en.wikipedia.org/wiki/Elon_Musk');
      }),
  Reference(
      name: 'Larry Page',
      onTapp: () {
        _controller.openUrl('https://en.wikipedia.org/wiki/Larry_Page');
      }),
  Reference(
      name: 'Doja Cat',
      onTapp: () {
        _controller.openUrl('https://en.wikipedia.org/wiki/Doja_Cat');
      }),
  Reference(
      name: 'Summer Walker',
      onTapp: () {
        _controller.openUrl('https://en.wikipedia.org/wiki/Summer_Walker');
      }),
  Reference(
      name: 'Rihanna',
      onTapp: () {
        _controller.openUrl('https://en.wikipedia.org/wiki/Rihanna');
      }),
  Reference(
      name: 'Jackie Chan',
      onTapp: () {
        _controller.openUrl('https://en.wikipedia.org/wiki/Jackie_Chan');
      }),
  Reference(
      name: 'Denzel Washington',
      onTapp: () {
        _controller.openUrl('https://en.wikipedia.org/wiki/Denzel_Washington');
      }),
  Reference(
      name: 'Ronaldo',
      onTapp: () {
        _controller.openUrl('https://en.wikipedia.org/wiki/Cristiano_Ronaldo');
      }),
  Reference(
      name: 'Burna Boy',
      onTapp: () {
        _controller.openUrl('https://en.wikipedia.org/wiki/Burna_Boy');
      }),
  Reference(
      name: 'Keanu Reeves',
      onTapp: () {
        _controller.openUrl('https://en.wikipedia.org/wiki/Keanu_Reeves');
      }),
  Reference(
      name: 'Bill Gate',
      onTapp: () {
        _controller.openUrl('https://en.wikipedia.org/wiki/Bill_Gate');
      }),
  Reference(
    name: 'Warren Buffet',
    onTapp: () {
      _controller.openUrl('https://en.wikipedia.org/wiki/Warren_Buffet');
    },
  ),
];
