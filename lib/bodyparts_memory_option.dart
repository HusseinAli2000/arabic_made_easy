import 'package:arabic_made_easy/bodyparts_memory.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'word_memory.dart';

class BodyPartsMemoryOption extends StatefulWidget {
  const BodyPartsMemoryOption({super.key});

  @override
  State<BodyPartsMemoryOption> createState() => _BodyPartsMemoryOptionState();
  static List<WordMemory> getSourceWords() {
    return _BodyPartsMemoryOptionState.sourceWords;
  }
}

class _BodyPartsMemoryOptionState extends State<BodyPartsMemoryOption> {
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
            return const BodyPartsMemory();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Future<int> populateSourceWords() async {
    sourceWords.clear();
    final ref = FirebaseStorage.instance.ref('bodyparts');
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
