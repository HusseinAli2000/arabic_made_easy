import 'package:arabic_made_easy/word_memory.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class GameManager extends ChangeNotifier {
  bool canFlip = false;
  bool reverseFlip = false;
  bool ignoreTaps = false;
  bool roundCompleted = false;
  List<int> answeredWords = [];

  Map<int, WordMemory> tappedWords = {};

  tilesTapped({required int index, required WordMemory word}) {
    ignoreTaps = true;
    if (tappedWords.length <= 1) {
      tappedWords.addEntries([MapEntry(index, word)]);
      canFlip = true;
    } else {
      canFlip = true;
    }
    notifyListeners();
  }

  onAnimationCompleted({required bool isForward}) {
    if (tappedWords.length == 2) {
      if (isForward) {
        if (tappedWords.entries.elementAt(0).value.text ==
            tappedWords.entries.elementAt(1).value.text) {
          answeredWords.addAll(tappedWords.keys);
          if (answeredWords.length == 6) {
            AudioPlayer().play(
              AssetSource('spelling/round_complete.mp3'),
            );
            roundCompleted = true;
          } else {
            AudioPlayer().play(
              AssetSource('spelling/correct.mp3'),
            );
          }
          tappedWords.clear();
          canFlip = true;
          ignoreTaps = false;
        } else {
          reverseFlip = true;
          AudioPlayer().play(
            AssetSource('spelling/incorrect.mp3'),
          );
        }
      } else {
        reverseFlip = false;
        tappedWords.clear();
        ignoreTaps = false;
      }
    } else {
      canFlip = false;
      ignoreTaps = false;
    }
    notifyListeners();
  }

  reset() {
    canFlip = false;
    reverseFlip = false;
    ignoreTaps = false;
    roundCompleted = false;
    answeredWords = [];
    tappedWords = {};

    notifyListeners();
  }
}
