import 'package:flutter/material.dart';

class FlashCardNotifier extends ChangeNotifier {
  bool flipCard1 = false;
  bool flipCard2 = false;

  runFlipCard1() {
    flipCard1 = true;
    notifyListeners();
  }

  runFlipCard2() {
    flipCard2 = true;
    notifyListeners();
  }
}
