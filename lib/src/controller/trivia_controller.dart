import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:strish/src/model/trivia_vault_model.dart';
import 'package:get/get.dart';
import 'package:audioplayers/audio_cache.dart';

class TriviaController extends GetxController {
  var _index = RxInt(0);
  var _score = RxInt(0);

  final _audioPlayer = AudioCache();

  int get userScore => _score.value;

  int get questionIndex => _index.value;

  String retrieveQuestion() => TriviaModel.trivia[_index.value].question;

  String retrieveAnswer() => TriviaModel.trivia[_index.value].answerImage;

  List retrieveOptions() => TriviaModel.trivia[_index.value].imageOptions;

  scoreLogic(imageAnswer) {
    if (imageAnswer == retrieveAnswer()) {
      return _score.value++;
    }
  }

  playSound(selectedImage) {
    if (selectedImage == retrieveAnswer()) {
      return _audioPlayer.play('correct.mp3');
    } else {
      return _audioPlayer.play('fail.mp3');
    }
  }

  launchReference() {
    final url = Uri.parse(TriviaModel.trivia[_index.value].reference);
    return TapGestureRecognizer()
      ..onTap = () async {
        if (await canLaunchUrl(url)) {
          await launchUrl(url);
        } else
          throw 'Url can\'t be launced';
      };
  }

  retrieveReference(imgg) {
    if (imgg == retrieveAnswer()) {
      return 'Reference';
    } else
      return '';
  }

  retrieveImageAnswer(img) {
    if (img == retrieveAnswer()) {
      return 'assets/images/correct.png';
    } else
      return 'assets/images/wrong.png';
  }

  retrieveNextQuestion() {
    if (_index <= TriviaModel.trivia.length - 2) {
      return _index.value++;
    }
  }

  void restart() {
    _index.value = 0;
    _score.value = 0;
  }

  openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else
      throw 'Url can\'t be launced';
  }
}
