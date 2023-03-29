import 'package:arabic_made_easy/animals_memory_cards.dart';
import 'package:arabic_made_easy/word_memory.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class AnimalMemoryCardsPage extends StatefulWidget {
  const AnimalMemoryCardsPage({super.key});

  @override
  State<AnimalMemoryCardsPage> createState() => _AnimalMemoryCardsPageState();

  static List<WordMemory> getSourceWords() {
    return _AnimalMemoryCardsPageState.sourceWords;
  }
}

class _AnimalMemoryCardsPageState extends State<AnimalMemoryCardsPage> {
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
            return const AnimalsMemoryCards();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Future<int> populateSourceWords() async {
    sourceWords.clear();
    final ref = FirebaseStorage.instance.ref('animals');
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
