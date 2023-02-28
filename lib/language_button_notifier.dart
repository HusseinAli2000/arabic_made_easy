import 'package:arabic_made_easy/language_type.dart';
import 'package:flutter/material.dart';

class LanguageButtonNotifier extends ChangeNotifier {
  bool showImage = true,
      showEnglish = true,
      showArabic = false,
      showPronunciation = false;

  updateShowLanguage({required LanguageType language}) {
    switch (language) {
      case LanguageType.image:
        showImage = !showImage;
        break;
      case LanguageType.english:
        showEnglish = !showEnglish;
        break;
      case LanguageType.arabic:
        showArabic = !showArabic;
        break;
      case LanguageType.pronunciation:
        showPronunciation = !showPronunciation;
        break;
    }
    notifyListeners();
  }
}
