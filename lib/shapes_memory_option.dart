import 'package:arabic_made_easy/shapes_memory.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'word_memory.dart';

class ShapesMemoryOption extends StatefulWidget {
  const ShapesMemoryOption({super.key});

  @override
  State<ShapesMemoryOption> createState() => _ShapesMemoryOptionState();
  static List<WordMemory> getSourceWords() {
    return _ShapesMemoryOptionState.sourceWords;
  }
}

class _ShapesMemoryOptionState extends State<ShapesMemoryOption> {
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
            return const ShapesMemory();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Future<int> populateSourceWords() async {
    sourceWords.clear();
    final ref = FirebaseStorage.instance.ref('shapes');
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
