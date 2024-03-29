import 'package:get/get.dart';

import '../controller/trivia_controller.dart';

TriviaController _triviaController = Get.put(TriviaController());

class ReferenceModel {
  ReferenceModel({required this.name, required this.onPressed});
  final String name;
  final void Function() onPressed;

  static List<ReferenceModel> references = [
    ReferenceModel(
        name: 'Bill Gate',
        onPressed: () {
          _triviaController.openUrl('https://en.wikipedia.org/wiki/Bill_Gate');
        }),
    ReferenceModel(
        name: 'Jeff Bezos',
        onPressed: () {
          _triviaController.openUrl('https://en.wikipedia.org/wiki/Jeff_Bezos');
        }),
    ReferenceModel(
        name: 'Elon Musk',
        onPressed: () {
          _triviaController.openUrl('https://en.wikipedia.org/wiki/Elon_Musk');
        }),
    ReferenceModel(
        name: 'Larry Page',
        onPressed: () {
          _triviaController.openUrl('https://en.wikipedia.org/wiki/Larry_Page');
        }),
    ReferenceModel(
        name: 'Doja Cat',
        onPressed: () {
          _triviaController.openUrl('https://en.wikipedia.org/wiki/Doja_Cat');
        }),
    ReferenceModel(
        name: 'Summer Walker',
        onPressed: () {
          _triviaController
              .openUrl('https://en.wikipedia.org/wiki/Summer_Walker');
        }),
    ReferenceModel(
        name: 'Rihanna',
        onPressed: () {
          _triviaController.openUrl('https://en.wikipedia.org/wiki/Rihanna');
        }),
    ReferenceModel(
        name: 'Jackie Chan',
        onPressed: () {
          _triviaController
              .openUrl('https://en.wikipedia.org/wiki/Jackie_Chan');
        }),
    ReferenceModel(
        name: 'Denzel Washington',
        onPressed: () {
          _triviaController
              .openUrl('https://en.wikipedia.org/wiki/Denzel_Washington');
        }),
    ReferenceModel(
        name: 'Ronaldo',
        onPressed: () {
          _triviaController
              .openUrl('https://en.wikipedia.org/wiki/Cristiano_Ronaldo');
        }),
    ReferenceModel(
        name: 'Burna Boy',
        onPressed: () {
          _triviaController.openUrl('https://en.wikipedia.org/wiki/Burna_Boy');
        }),
    ReferenceModel(
        name: 'Keanu Reeves',
        onPressed: () {
          _triviaController
              .openUrl('https://en.wikipedia.org/wiki/Keanu_Reeves');
        }),
    ReferenceModel(
        name: 'Bill Gate',
        onPressed: () {
          _triviaController.openUrl('https://en.wikipedia.org/wiki/Bill_Gate');
        }),
    ReferenceModel(
      name: 'Warren Buffet',
      onPressed: () {
        _triviaController
            .openUrl('https://en.wikipedia.org/wiki/Warren_Buffet');
      },
    ),
  ];
}
