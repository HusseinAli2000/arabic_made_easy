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
