import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:strish/src/utils/constants.dart';
import 'package:strish/src/controller/controller.dart';
import 'package:strish/src/model/references_model.dart';

MyController _controller = Get.put(MyController());

class References extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.height;
    double _height = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        body: Container(
          height: _height,
          width: _width,
          child: ListView(
            children: [
              Container(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      colors: [
                        kLightPurple.withOpacity(.2),
                        kDeepPurple.withOpacity(.5),
                      ],
                    ),
                  ),
                ),
                margin: EdgeInsets.all(8),
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage('assets/images/kehlani.png'),
                      fit: BoxFit.cover),
                ),
              ),
              for (var ref in references)
                BuildRefs(onTapp: ref.onTapp!, name: ref.name!),
            ],
          ),
        ),
      ),
    );
  }

  buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Text(
        'References',
        style: kTextStyle,
      ),
      leading: Builder(
        builder: (BuildContext context) => IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: kDeepPurple,
          ),
          color: Colors.transparent,
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
      }),
];
