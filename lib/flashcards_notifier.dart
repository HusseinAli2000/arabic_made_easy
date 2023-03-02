import 'dart:math';

import 'package:arabic_made_easy/results_box.dart';
import 'package:arabic_made_easy/slide_direction.dart';
import 'package:arabic_made_easy/word.dart';
import 'package:flutter/material.dart';

import 'words.dart';

class FlashCardNotifier extends ChangeNotifier {
  int roundTally = 0;
  int cardTally = 0;
  int correctTally = 0;
  int incorrectTally = 0;
  int correctPercentage = 0;

  calculateCorrectPercentage() {
    final percentage = (correctTally / cardTally) * 100;
    correctPercentage = percentage.round();
  }

  double percentComplete = 0.0;
  calculateCompletePercent() {
    percentComplete = (correctTally + incorrectTally) / cardTally;
    notifyListeners();
  }

  resetProgressBar() {
    percentComplete = 0.0;
    notifyListeners();
  }

  List<Word> incorrectCards = [];

  String topic = "";
  Word word1 =
      Word(topic: "", arabic: "", english: "circle", pronunciation: "");
  Word word2 =
      Word(topic: "", arabic: "", english: "circle", pronunciation: "");
  List<Word> selectedWords = [];

  bool isFirstRound = true;
  bool isRoundCompleted = false;
  bool isSessionCompleted = false;

  reset() {
    resetCard1();
    resetCard2();
    incorrectCards.clear();
    isFirstRound = true;
    isRoundCompleted = false;
    isSessionCompleted = false;
    roundTally = 0;
  }

  setTopic({required String topic}) {
    this.topic = topic;
    notifyListeners();
  }

  generateAllSelectedWord() {
    isRoundCompleted = false;
    if (isFirstRound) {
      if (topic != 'Review') {
        selectedWords.clear();
        selectedWords =
            words.where((element) => element.topic == "Animals").toList();
      }
    } else {
      selectedWords = incorrectCards.toList();
      incorrectCards.clear();
    }
    roundTally++;
    cardTally = selectedWords.length;
    correctTally = 0;
    incorrectTally = 0;
    resetProgressBar();
  }

  generateCurrentWord({required BuildContext context}) {
    if (selectedWords.isNotEmpty) {
      final r = Random().nextInt(selectedWords.length);
      word1 = selectedWords[r];
      selectedWords.removeAt(r);
    } else {
      if (incorrectCards.isEmpty) {
        isSessionCompleted = true;
        print('Session Completed: $isSessionCompleted');
      }
      isRoundCompleted = true;
      isFirstRound = false;
      calculateCorrectPercentage();
      Future.delayed(Duration(milliseconds: 500), () {
        showDialog(context: context, builder: (context) => ResultsBox());
      });
    }

    Future.delayed(
      const Duration(
        milliseconds: 600,
      ),
      (() {
        word2 = word1;
      }),
    );
  }

  updateCardOutcome({required Word word, required bool isCorrect}) {
    if (!isCorrect) {
      incorrectCards.add(word);
      incorrectTally++;
    } else {
      correctTally++;
    }
    calculateCompletePercent();
    notifyListeners();
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
    updateCardOutcome(
        word: word2, isCorrect: direction == SlideDirection.leftAway);
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
