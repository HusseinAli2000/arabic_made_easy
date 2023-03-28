import 'package:arabic_made_easy/colors_memory.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'word_memory.dart';

class ColorsMemoryOption extends StatefulWidget {
  const ColorsMemoryOption({super.key});

  @override
  State<ColorsMemoryOption> createState() => _ColorsMemoryOptionState();
  static List<WordMemory> getSourceWords() {
    return _ColorsMemoryOptionState.sourceWords;
  }
}

class _ColorsMemoryOptionState extends State<ColorsMemoryOption> {
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
            return const ColorsMemory();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Future<int> populateSourceWords() async {
    sourceWords.clear();
    final ref = FirebaseStorage.instance.ref('colors');
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
