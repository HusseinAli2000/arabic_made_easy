import 'package:arabic_made_easy/flashcards_notifier.dart';
import 'package:arabic_made_easy/tts_button.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class CardDisplay extends StatelessWidget {
  const CardDisplay({
    Key? key,
    required this.isCard1,
  }) : super(key: key);

  final bool isCard1;

  @override
  Widget build(BuildContext context) {
    return Consumer<FlashCardNotifier>(
      builder: (_, notifier, __) => isCard1
          ? Column(
              children: [
                buildImage(notifier.word1.english),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  notifier.word1.english,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 235, 234, 243),
                    fontFamily: 'Akaya',
                    fontSize: 50,
                  ),
                ),
              ],
            )
          : Column(
              children: [
                buildImage(notifier.word2.english),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  notifier.word2.arabic,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 235, 234, 243),
                    fontFamily: 'Akaya',
                    fontSize: 40,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  notifier.word2.pronunciation,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 235, 234, 243),
                    fontFamily: 'Akaya',
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                
                const TTSButton(),
              ],
            ),
    );
  }

  Column buildImage(String image) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        Image.asset(
          'images/${image.toLowerCase()}.png',
          width: 150,
          height: 150,
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}
