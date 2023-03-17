import 'package:arabic_made_easy/animals_spelling.dart';
import 'package:arabic_made_easy/message_box.dart';
import 'package:arabic_made_easy/words.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'word.dart';

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

  incrementLetters({
    required BuildContext context,
  }) {
    lettersAnswered++;
    if (lettersAnswered == totalLetters) {
      AudioPlayer().play(
        AssetSource('spelling/2.mp3'),
      );

      wordsAnswered++;
      percentCompleted = wordsAnswered / AnimalWords.length;
      if (wordsAnswered == AnimalWords.length) {
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
  }
}
