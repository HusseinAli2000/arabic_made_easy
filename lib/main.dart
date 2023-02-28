import 'package:arabic_made_easy/flashcards_notifier.dart';
import 'package:arabic_made_easy/language_button_notifier.dart';
import 'package:arabic_made_easy/settings_notifier.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FlashCardNotifier()),
        ChangeNotifierProvider(create: (_) => SettingsNotifier()),
        ChangeNotifierProvider(create: (_) => LanguageButtonNotifier()),
      ],
      child: const MainPage(),
    ),
  );
}
