import 'package:arabic_made_easy/flashcards_notifier.dart';
import 'package:arabic_made_easy/language_button_notifier.dart';
import 'package:arabic_made_easy/settings_notifier.dart';
import 'package:arabic_made_easy/spelling_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'main_page.dart';
import 'word_memory.dart';

List<WordMemory> sourceWords = [];

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FlashCardNotifier()),
        ChangeNotifierProvider(create: (_) => SettingsNotifier()),
        ChangeNotifierProvider(create: (_) => LanguageButtonNotifier()),
        ChangeNotifierProvider(create: (_) => Controller()),
      ],
      child: MaterialApp(
        home: Scaffold(
          body: FutureBuilder(
            future: populateSourceWords(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Material(
                    child: Text(
                      'Error, Check Your Connection',
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }

              if (snapshot.hasData) {
                print('Sucess! There are ${sourceWords.length} source words');
                return MainPage();
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    ),
  );
}

Future<int> populateSourceWords() async {
  final ref = FirebaseStorage.instance.ref();
  final all = await ref.listAll();

  for (var item in all.items) {
    sourceWords.add(WordMemory(
        displayText: false,
        text: item.name.substring(0, item.name.indexOf('.')),
        url: await item.getDownloadURL()));
  }

  return 1;
}
