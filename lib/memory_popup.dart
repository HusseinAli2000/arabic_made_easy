import 'package:arabic_made_easy/animals_memory_cards.dart';
import 'package:arabic_made_easy/game_manager.dart';
import 'package:arabic_made_easy/main_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'animals_memory_cards_options.dart';

class MemoryPopup extends StatelessWidget {
  const MemoryPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameManager>(
      builder: (_, notifier, __) => AlertDialog(
        content: Column(children: [
          Text('Well Done!'),
          ElevatedButton(
            onPressed: () {
              notifier.reset();
              Navigator.pushAndRemoveUntil(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (_, __, ___) => AnimalMemoryCardsPage()),
                  (route) => false);
            },
            child: Text('Replay'),
          )
        ]),
      ),
    );
  }
}
