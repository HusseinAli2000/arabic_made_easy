import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'cuw_memory.dart';
import 'transport_memory.dart';
import 'word_memory.dart';

class CuwMemoryOption extends StatefulWidget {
  const CuwMemoryOption({super.key});

  @override
  State<CuwMemoryOption> createState() => _CuwMemoryOptionState();
  static List<WordMemory> getSourceWords() {
    return _CuwMemoryOptionState.sourceWords;
  }
}

class _CuwMemoryOptionState extends State<CuwMemoryOption> {
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
            print('Success! There are ${sourceWords.length} source words');
            return const CuwMemory();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Future<int> populateSourceWords() async {
    sourceWords.clear();
    final ref = FirebaseStorage.instance.ref('cuw');
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
