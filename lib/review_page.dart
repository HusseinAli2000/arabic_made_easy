import 'package:arabic_made_easy/animals_quiz.dart';
import 'package:arabic_made_easy/database_manager.dart';
import 'package:arabic_made_easy/flashcards_notifier.dart';
import 'package:arabic_made_easy/language_button_notifier.dart';
import 'package:arabic_made_easy/language_type.dart';
import 'package:arabic_made_easy/settings_to_text.dart';
import 'package:arabic_made_easy/tts_button.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

import 'second_page.dart';
import 'settings_page.dart';
import 'word.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final _listKey = GlobalKey<AnimatedListState>();
  final _reviewWords = [];

  @override
  Widget build(BuildContext context) {
    return Consumer<FlashCardNotifier>(
      builder: (_, notifier, __) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 32, 6, 96),
                  Color.fromARGB(255, 57, 119, 194),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 9),
              child: GNav(
                gap: 15,
                padding: const EdgeInsets.all(6),
                backgroundColor: Colors.transparent,
                textStyle: const TextStyle(
                  fontFamily: 'Akaya',
                  fontSize: 18,
                  color: Color.fromARGB(255, 235, 234, 243),
                  fontWeight: FontWeight.bold,
                ),
                tabBackgroundColor: const Color.fromARGB(161, 6, 12, 58),
                color: const Color.fromARGB(255, 235, 234, 243),
                activeColor: const Color.fromARGB(255, 235, 234, 243),
                onTabChange: (index) {
                  if (index == 0) {
                    Future.delayed(
                      const Duration(seconds: 1),
                      () {
                        setState(
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PageTwo(),
                              ),
                            );
                          },
                        );
                      },
                    );
                  } else if (index == 1) {
                    Future.delayed(
                      const Duration(seconds: 1),
                      () {
                        setState(
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PageTwo(),
                              ),
                            );
                          },
                        );
                      },
                    );
                  } else if (index == 2) {
                    Future.delayed(
                      const Duration(milliseconds: 500),
                      () {
                        setState(
                          () {
                            notifier.reset();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SettingsPage(),
                              ),
                            );
                          },
                        );
                      },
                    );
                  }
                },
                tabs: const [
                  GButton(
                    icon: Icons.arrow_back,
                    text: 'Back',
                  ),
                  GButton(
                    icon: Icons.class_,
                    text: 'Classes',
                  ),
                  GButton(
                    icon: Icons.settings,
                    text: 'Settings',
                  ),
                ],
              ),
            ),
          ),
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 32, 6, 96),
                    Color.fromARGB(255, 57, 119, 194),
                  ],
                ),
              ),
            ),
            title: const Center(
              child: Text(
                'Flashcards Quiz Review',
                style: TextStyle(
                  fontFamily: 'Akaya',
                  fontSize: 25,
                  color: Color.fromARGB(255, 235, 234, 243),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 125, 173, 232),
                  Color.fromARGB(255, 20, 0, 70),
                ],
              ),
            ),
            child: Center(
              child: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Selector<LanguageButtonNotifier, bool>(
                        selector: (_, review) => review.buttonsAreDisabled,
                        builder: (_, disable, __) => Row(
                          children: [
                            HeaderButton(
                              isDisabled: disable,
                              title: 'Test All',
                              onPressed: () {
                                final provider = Provider.of<FlashCardNotifier>(
                                    context,
                                    listen: false);
                                provider.selectedWords.clear();
                                DatabaseManager().selectWord().then((words) {
                                  provider.selectedWords = words.toList();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AnimalsQuiz()));
                                });
                              },
                            ),
                            HeaderButton(
                              isDisabled: disable,
                              title: 'Test 3',
                              onPressed: () {
                                final provider = Provider.of<FlashCardNotifier>(
                                    context,
                                    listen: false);
                                provider.selectedWords.clear();
                                DatabaseManager()
                                    .selectWord(limit: 3)
                                    .then((words) {
                                  provider.selectedWords = words.toList();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AnimalsQuiz()));
                                });
                              },
                            ),
                            HeaderButton(
                              isDisabled: disable,
                              title: 'Clear All',
                              onPressed: () {
                                _clearAllWords();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: FutureBuilder(
                        future: DatabaseManager().selectWord(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            var sortList = snapshot.data as List<Word>;
                            sortList
                                .sort((a, b) => a.english.compareTo(b.english));

                            WidgetsBinding.instance
                                .addPostFrameCallback((timeStamp) {
                              _insertWords(word: sortList);
                            });

                            return AnimatedList(
                              key: _listKey,
                              initialItemCount: _reviewWords.length,
                              itemBuilder: (context, index, animation) =>
                                  WordTile(
                                index: index,
                                word: _reviewWords[index],
                                animation: animation,
                                onPressed: () {
                                  _removeWord(word: _reviewWords[index]);
                                },
                              ),
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: Selector<LanguageButtonNotifier, bool>(
                        selector: (_, review) => review.buttonsAreDisabled,
                        builder: (_, disable, __) => Row(
                          children: [
                            LanguageButton(
                              isDisabled: disable,
                              languageType: LanguageType.image,
                            ),
                            LanguageButton(
                              isDisabled: disable,
                              languageType: LanguageType.english,
                            ),
                            LanguageButton(
                              isDisabled: disable,
                              languageType: LanguageType.arabic,
                            ),
                            LanguageButton(
                              isDisabled: disable,
                              languageType: LanguageType.pronunciation,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _insertWords({required List<Word> word}) {
    for (int i = 0; i < word.length; i++) {
      _listKey.currentState?.insertItem(i);
      _reviewWords.insert(i, word[i]);
    }
  }

  _removeWord({required Word word}) async {
    var w = word;
    _listKey.currentState?.removeItem(
        _reviewWords.indexOf(w),
        (context, animation) => WordTile(
              word: word,
              animation: animation,
              index: _reviewWords.indexOf(w),
            ));
    _reviewWords.remove(w);
    await DatabaseManager().removeWord(word: w);
    if (_reviewWords.isEmpty) {
      Provider.of<LanguageButtonNotifier>(context, listen: false)
          .disableButtons(disable: true);
    }
  }

  _clearAllWords() {
    for (int i = 0; i < _reviewWords.length; i++) {
      _listKey.currentState?.removeItem(
        0,
        (context, animation) => WordTile(
          word: _reviewWords[i],
          animation: animation,
          index: i,
        ),
      );
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      _reviewWords.clear();
      await DatabaseManager().removeAllWords();
      Provider.of<LanguageButtonNotifier>(context, listen: false)
          .disableButtons(disable: true);
    });
  }
}

class LanguageButton extends StatelessWidget {
  const LanguageButton({
    Key? key,
    required this.languageType,
    this.isDisabled = false,
  }) : super(key: key);

  final LanguageType languageType;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 32, 6, 96),
                Color.fromARGB(255, 57, 119, 194),
              ],
            ),
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(130, 35, 61, 155),
              textStyle: const TextStyle(
                color: Color.fromARGB(255, 235, 234, 243),
                fontFamily: 'Akaya',
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: isDisabled
                ? null
                : () {
                    Provider.of<LanguageButtonNotifier>(context, listen: false)
                        .updateShowLanguage(language: languageType);
                  },
            child: Text(languageType.toSymbol()),
          ),
        ),
      ),
    );
  }
}

class WordTile extends StatelessWidget {
  WordTile({
    Key? key,
    required this.word,
    required this.animation,
    this.onPressed,
    required this.index,
  }) : super(key: key);

  final Word word;

  final Animation animation;
  final _tweenOffsetLeft =
      Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0));
  final _tweenOffsetRight =
      Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0));
  final VoidCallback? onPressed;
  final int index;
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation
          .drive(CurveTween(curve: Curves.easeInOutSine))
          .drive(index % 2 == 0 ? _tweenOffsetRight : _tweenOffsetLeft),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(7, 7, 7, 7),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 235, 234, 243),
                ),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 32, 6, 96),
                    Color.fromARGB(255, 57, 119, 194),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(130, 35, 61, 155),
              ),
              child: Consumer<LanguageButtonNotifier>(
                builder: (_, notifier, __) => ListTile(
                  leading: notifier.showImage
                      ? SizedBox(
                          width: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Image.asset(
                              'images/${word.english}.png'.toLowerCase(),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        TTSButton(
                          word: word,
                          iconSize: 25,
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.clear,
                            color: Color.fromARGB(255, 235, 234, 243),
                          ),
                          onPressed: () {
                            onPressed?.call();
                          },
                        ),
                      ],
                    ),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        notifier.showEnglish
                            ? Text(
                                word.english,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 235, 234, 243),
                                  fontFamily: 'Akaya',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : const SizedBox(),
                        notifier.showArabic
                            ? Text(
                                word.arabic,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 235, 234, 243),
                                  fontFamily: 'Akaya',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : const SizedBox(),
                        notifier.showPronunciation
                            ? Text(
                                word.pronunciation,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 235, 234, 243),
                                  fontFamily: 'Akaya',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          // const Divider(
          //   height: 1,
          //   thickness: 1,
          //   color: Color.fromARGB(78, 0, 17, 115),
          // )
        ],
      ),
    );
  }
}

class HeaderButton extends StatelessWidget {
  const HeaderButton({
    Key? key,
    this.isDisabled = false,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final VoidCallback onPressed;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 32, 6, 96),
                Color.fromARGB(255, 57, 119, 194),
              ],
            ),
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(130, 35, 61, 155),
              textStyle: const TextStyle(
                color: Color.fromARGB(255, 235, 234, 243),
                fontFamily: 'Akaya',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: isDisabled ? null : onPressed,
            child: Text(title),
          ),
        ),
      ),
    );
  }
}
