import 'package:arabic_made_easy/guide_box.dart';
import 'package:arabic_made_easy/language_type.dart';

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

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

runGuideBox({required BuildContext context, required bool isFirst}) {
  if (!isFirst)
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool('guidebox', true);
    });
  Future.delayed(const Duration(milliseconds: 1200), () {
    showDialog(
        context: context,
        builder: (context) => GuideBox(
              isFirst: isFirst,
            ));
  });
}
