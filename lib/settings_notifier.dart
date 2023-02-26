import 'package:arabic_made_easy/settings.dart';
import 'package:flutter/material.dart';

class SettingsNotifier extends ChangeNotifier {
  Map<Settings, bool> displayOptions = {
    Settings.englishFirst: true,
    Settings.showPronunciation: true,
    Settings.audioOnly: false,
  };
  updateDisplayOptions(
      {required Settings displayOption, required bool isToggled}) {
    displayOptions.update(displayOption, (value) => isToggled);
    notifyListeners();
  }

  resetSettings() {
    displayOptions.update(Settings.englishFirst, (value) => true);
    displayOptions.update(Settings.showPronunciation, (value) => true);
    displayOptions.update(Settings.audioOnly, (value) => false);
    notifyListeners();
  }
}
