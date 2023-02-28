import 'package:arabic_made_easy/language_type.dart';
import 'package:flutter/material.dart';

import 'settings.dart';

extension SettingsToText on Settings {
  String toText() {
    switch (this) {
      case Settings.englishFirst:
        return 'Show English First';
      case Settings.showPronunciation:
        return 'Show pronunciation';
      case Settings.audioOnly:
        return 'Audio Only';
    }
  }
}

extension LanguageSymbol on LanguageType {
  String toSymbol() {
    switch (this) {
      case LanguageType.image:
        return '🖼️';
      case LanguageType.english:
        return 'Abc';
      case LanguageType.arabic:
        return 'أ ب ت';
      case LanguageType.pronunciation:
        return 'Pronounce';
    }
  }
}
