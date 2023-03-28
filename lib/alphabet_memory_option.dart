import 'package:arabic_made_easy/alphabet_memory.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'word_memory.dart';

class AlphabetMemoryOption extends StatefulWidget {
  const AlphabetMemoryOption({super.key});

  @override
  State<AlphabetMemoryOption> createState() => _AlphabetMemoryOptionState();
  static List<WordMemory> getSourceWords() {
    return _AlphabetMemoryOptionState.sourceWords;
  }
}

class _AlphabetMemoryOptionState extends State<AlphabetMemoryOption> {
  static List<WordMemory> sourceWords = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: populateSourceWords(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
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
            print('Success! There are ${sourceWords.length} source words');
            return const AlphabetMemory();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Future<int> populateSourceWords() async {
    sourceWords.clear();
    final ref = FirebaseStorage.instance.ref('alphabet');
    final all = await ref.listAll();

    for (var item in all.items) {
      sourceWords.add(WordMemory(
          displayText: false,
          text: item.name.substring(0, item.name.indexOf('.')),
          url: await item.getDownloadURL()));
    }

    return 1;
  }
}
