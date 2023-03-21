import 'package:arabic_made_easy/flashcards_notifier.dart';
import 'package:arabic_made_easy/game_manager.dart';
import 'package:arabic_made_easy/language_button_notifier.dart';
import 'package:arabic_made_easy/settings_notifier.dart';
import 'package:arabic_made_easy/spelling_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'main_page.dart';
import 'word_memory.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FlashCardNotifier()),
        ChangeNotifierProvider(create: (_) => SettingsNotifier()),
        ChangeNotifierProvider(create: (_) => LanguageButtonNotifier()),
        ChangeNotifierProvider(create: (_) => Controller()),
        ChangeNotifierProvider(create: (_) => GameManager())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: MainPage(),
        ),
      ),
    ),
  );
}
