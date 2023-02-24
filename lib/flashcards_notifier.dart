import 'dart:math';

import 'package:arabic_made_easy/slide_direction.dart';
import 'package:arabic_made_easy/word.dart';
import 'package:flutter/material.dart';

import 'words.dart';

class FlashCardNotifier extends ChangeNotifier {
  String topic = "";
  Word word1 =
      Word(topic: "", arabic: "", english: "circle", pronunciation: "");
  Word word2 =
      Word(topic: "", arabic: "", english: "circle", pronunciation: "");
  List<Word> selectedWords = [];

  setTopic({required String topic}) {
    this.topic = topic;
    notifyListeners();
  }

  generateAllSelectedWord() {
    selectedWords.clear();
    selectedWords =
        words.where((element) => element.topic == "Animals").toList();
  }

  generateCurrentWord() {
    if (selectedWords.isNotEmpty) {
      final r = Random().nextInt(selectedWords.length);
      word1 = selectedWords[r];
      selectedWords.removeAt(r);
    } else {
      print("All words selected");
    }

    Future.delayed(
        const Duration(
          milliseconds: 600,
        ), (() {
      word2 = word1;
    }));
  }

  SlideDirection swipeDirection = SlideDirection.none;

  bool flipCard1 = false;
  bool flipCard2 = false;
  bool swipeCard2 = false;
  bool slideCard1 = false;
  bool resetSlideCard1 = false;
  bool resetFlipCard1 = false;
  bool resetFlipCard2 = false;
  bool resetSwipeCard2 = false;
  bool ignoreTouches = true;

  setIgnoreTouch({required bool ignore}) {
    ignoreTouches = ignore;
    notifyListeners();
  }

  runSlideCard1() {
    resetSlideCard1 = false;
    slideCard1 = true;
    notifyListeners();
  }

  runFlipCard1() {
    resetFlipCard1 = false;
    flipCard1 = true;
    notifyListeners();
  }

  resetCard1() {
    resetSlideCard1 = true;
    resetFlipCard1 = true;
    slideCard1 = false;
    flipCard1 = false;
  }

  runFlipCard2() {
    resetFlipCard2 = false;
    flipCard2 = true;
    notifyListeners();
  }

  runSwipeCard2({required SlideDirection direction}) {
    swipeDirection = direction;
    resetSwipeCard2 = false;
    swipeCard2 = true;
    notifyListeners();
  }

  resetCard2() {
    resetSwipeCard2 = true;
    resetFlipCard2 = true;
    flipCard2 = false;
    swipeCard2 = false;
  }
}
