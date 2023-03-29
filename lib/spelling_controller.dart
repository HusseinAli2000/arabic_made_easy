import 'package:arabic_made_easy/message_box.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Controller extends ChangeNotifier {
  int totalLetters = 0;
  int lettersAnswered = 0;
  int wordsAnswered = 0;
  bool generateWord = true;
  bool sessionCompleted = false;
  double percentCompleted = 0;

  setUp({required int total}) {
    totalLetters = total;
    lettersAnswered = 0;
    notifyListeners();
  }

  incrementLettersAllAnimals({
    required BuildContext context,
  }) {
    lettersAnswered++;
    if (lettersAnswered == totalLetters) {
      AudioPlayer().play(
        AssetSource('spelling/2.mp3'),
      );

      wordsAnswered++;
      percentCompleted = wordsAnswered / 10;
      if (wordsAnswered == 10) {
        sessionCompleted = true;
      }

      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => MessageBox(
                sessionCompleted: sessionCompleted,
              ));
    } else {
      AudioPlayer().play(
        AssetSource('spelling/1.mp3'),
      );
    }
    notifyListeners();
  }

  requestWord({required bool request}) {
    generateWord = request;
    notifyListeners();
  }

  reset() {
    sessionCompleted = false;
    wordsAnswered = 0;
    generateWord = true;
    percentCompleted = 0;
    lettersAnswered = 0;
    totalLetters = 0;
  }
}
