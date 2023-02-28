import 'package:arabic_made_easy/flashcards_notifier.dart';
import 'package:arabic_made_easy/settings_notifier.dart';
import 'package:arabic_made_easy/tts_button.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'settings.dart';

class CardDisplay extends StatelessWidget {
  const CardDisplay({
    Key? key,
    required this.isCard1,
  }) : super(key: key);

  final bool isCard1;

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsNotifier>(
      builder: (_, notifier, __) {
        final setEnglishFirst = notifier.displayOptions.entries
            .firstWhere((element) => element.key == Settings.englishFirst)
            .value;

        final showPronunciation = notifier.displayOptions.entries
            .firstWhere((element) => element.key == Settings.showPronunciation)
            .value;

        final audioOnly = notifier.displayOptions.entries
            .firstWhere((element) => element.key == Settings.audioOnly)
            .value;

        return Consumer<FlashCardNotifier>(
          builder: (_, notifier, __) => isCard1
              ? Column(
                  //card 1
                  children: [
                    if (audioOnly) ...[
                      SizedBox(
                        height: 180,
                      ),
                      TTSButton(word: notifier.word1)
                    ] else if (!setEnglishFirst) ...[
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        notifier.word1.arabic,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 235, 234, 243),
                          fontFamily: 'Akaya',
                          fontSize: 60,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      showPronunciation
                          ? Text(
                              notifier.word1.pronunciation,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 235, 234, 243),
                                fontFamily: 'Akaya',
                                fontSize: 35,
                              ),
                            )
                          : SizedBox(),
                      const SizedBox(
                        height: 35,
                      ),
                      TTSButton(word: notifier.word1),
                    ] else ...[
                      buildImage(notifier.word1.english),
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        notifier.word1.english,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 235, 234, 243),
                          fontFamily: 'Akaya',
                          fontSize: 45,
                        ),
                      ),
                    ]
                  ],
                )
              : Column(
                  // card 2
                  children: [
                    if (audioOnly) ...[
                      buildImage(notifier.word2.english),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        notifier.word2.english,
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 235, 234, 243),
                          fontFamily: 'Akaya',
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        notifier.word2.arabic,
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 235, 234, 243),
                          fontFamily: 'Akaya',
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      showPronunciation
                          ? Text(
                              notifier.word2.pronunciation,
                              textDirection: TextDirection.rtl,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 235, 234, 243),
                                fontFamily: 'Akaya',
                                fontSize: 20,
                              ),
                            )
                          : SizedBox(),
                      SizedBox(
                        height: 10,
                      ),
                      TTSButton(word: notifier.word1)
                    ] else if (!setEnglishFirst) ...[
                      SizedBox(
                        height: 15,
                      ),
                      buildImage(notifier.word2.english),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        notifier.word2.english,
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 235, 234, 243),
                          fontFamily: 'Akaya',
                          fontSize: 40,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ] else ...[
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
                      showPronunciation
                          ? Text(
                              notifier.word2.pronunciation,
                              textDirection: TextDirection.rtl,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 235, 234, 243),
                                fontFamily: 'Akaya',
                                fontSize: 25,
                              ),
                            )
                          : SizedBox(),
                      TTSButton(word: notifier.word1),
                    ]
                  ],
                ),
        );
      },
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
