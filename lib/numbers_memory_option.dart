import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'numbers_memory.dart';
import 'word_memory.dart';

class NumbersMemoryOption extends StatefulWidget {
  const NumbersMemoryOption({super.key});

  @override
  State<NumbersMemoryOption> createState() => _NumbersMemoryOptionState();
  static List<WordMemory> getSourceWords() {
    return _NumbersMemoryOptionState.sourceWords;
  }
}

class _NumbersMemoryOptionState extends State<NumbersMemoryOption> {
  @override
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
            return const NumbersMemory();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Future<int> populateSourceWords() async {
    sourceWords.clear();
    final ref = FirebaseStorage.instance.ref('numbers');
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
