import 'dart:math';

import 'package:arabic_made_easy/cuw.dart';
import 'package:arabic_made_easy/second_page.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

import 'fly_in_animation.dart';
import 'spelling_controller.dart';
import 'spelling_progress_bar.dart';
import 'tts_button_two.dart';
import 'words.dart';

class CuwSpelling extends StatefulWidget {
  const CuwSpelling({super.key});

  @override
  State<CuwSpelling> createState() => _CuwSpellingState();
}

class _CuwSpellingState extends State<CuwSpelling> {
  late List<String> _words;
  late String _word, _dropWord, wordComplete;
  _generateWords() {
    _words = CuwWords.toList()..shuffle();
    _words = _words.take(10).toList();
  }

  _generateWord() {
    final r = Random().nextInt(_words.length);
    _word = _words[r];
    _words.removeAt(r);
    _dropWord = _word.toString().split('').reversed.join();
    wordComplete = _dropWord.toString().split('').reversed.join();
    final s = _word.characters.toList()..shuffle();
    _word = s.join();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<Controller>(context, listen: false)
          .setUp(total: _word.length);
      Provider.of<Controller>(context, listen: false)
          .requestWord(request: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    _generateWords();
    return Selector<Controller, bool>(
      selector: (_, controller) => controller.generateWord,
      builder: (_, generate, __) {
        if (generate) {
          if (_words.isNotEmpty) {
            _generateWord();
          }
        }
        return MaterialApp(
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
                      AudioPlayer().play(
                        AssetSource('spelling/click.mp3'),
                      );
                      Future.delayed(
                        const Duration(milliseconds: 500),
                        () {
                          setState(
                            () {
                              Provider.of<Controller>(context, listen: false)
                                  .reset();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const CommonlyUsedWords(),
                                ),
                              );
                            },
                          );
                        },
                      );
                    } else if (index == 1) {
                      AudioPlayer().play(
                        AssetSource('spelling/click.mp3'),
                      );
                      Future.delayed(
                        const Duration(milliseconds: 500),
                        () {
                          setState(
                            () {
                              Provider.of<Controller>(context, listen: false)
                                  .reset();
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
                  'Commonly Used Words Writing Quiz',
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
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TTSButtonTwo(
                                word: wordComplete,
                                iconSize: 40,
                              )
                            ]),
                      ),
                      Expanded(
                        flex: 3,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: _dropWord.characters
                                .map(
                                  (e) => FlyInAnimation(
                                    animate: true,
                                    child: Drop(
                                      letter: e,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: FlyInAnimation(
                            animate: true,
                            child: Image.asset(
                              'images/${_dropWord.toString().split('').reversed.join()}.png',
                              height: 300,
                              width: 300,
                              fit: BoxFit.contain,
                            )),
                      ),
                      Expanded(
                        flex: 3,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: _word.characters
                                .map(
                                  (e) => FlyInAnimation(
                                      animate: true, child: Drag(letter: e)),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: SpellingProgressBar(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class Drop extends StatelessWidget {
  const Drop({
    Key? key,
    required this.letter,
  }) : super(key: key);

  final String letter;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool accepted = false;
    return SizedBox(
      width: size.width * 0.15,
      height: size.height * 0.15,
      child: Center(
        child: DragTarget(
          onWillAccept: (data) {
            if (data == letter) {
              return true;
            } else {
              return false;
            }
          },
          onAccept: (data) {
            accepted = true;
          },
          builder: (context, candidateData, rejectedData) {
            if (accepted) {
              return Text(
                letter,
                style: const TextStyle(
                    color: Color.fromARGB(255, 235, 234, 243),
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              );
            } else {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 35, 61, 155),
                ),
                height: 50,
                width: 50,
              );
            }
          },
        ),
      ),
    );
  }
}

class Drag extends StatefulWidget {
  const Drag({
    Key? key,
    required this.letter,
  }) : super(key: key);

  final String letter;

  @override
  State<Drag> createState() => _DragState();
}

class _DragState extends State<Drag> {
  bool _accepted = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Selector<Controller, bool>(
        selector: (_, controller) => controller.generateWord,
        builder: (_, generate, __) {
          if (generate) {
            _accepted = false;
          }
          return SizedBox(
            width: size.width * 0.15,
            height: size.height * 0.15,
            child: _accepted
                ? const SizedBox()
                : Center(
                    child: Draggable(
                      data: widget.letter,
                      onDragEnd: (details) {
                        if (details.wasAccepted) {
                          _accepted = true;
                          setState(() {});
                          Provider.of<Controller>(context, listen: false)
                              .incrementLettersAllAnimals(context: context);
                        }
                      },
                      childWhenDragging: const SizedBox(),
                      feedback: Text(
                        widget.letter,
                        style: TextStyle(
                            color: const Color.fromARGB(255, 235, 234, 243),
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                offset: const Offset(3, 3),
                                color: Colors.black.withOpacity(0.40),
                                blurRadius: 5,
                              ),
                            ]),
                      ),
                      child: Text(
                        widget.letter,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 235, 234, 243),
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
          );
        });
  }
}
