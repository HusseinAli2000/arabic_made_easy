import 'dart:math';

import 'package:arabic_made_easy/fly_in_animation.dart';
import 'package:arabic_made_easy/words.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

import 'animals.dart';
import 'second_page.dart';
import 'spelling_controller.dart';
import 'word.dart';

class AnimalsSpelling extends StatefulWidget {
  const AnimalsSpelling({super.key, required this.wordCompleted});

  final bool wordCompleted;

  @override
  State<AnimalsSpelling> createState() => _AnimalsSpellingState();
}

class _AnimalsSpellingState extends State<AnimalsSpelling> {
  List<String> _words = AnimalWords.toList();
  String _word = '', _dropWord = '';

  _generateWord() {
    final r = Random().nextInt(_words.length);
    _word = _words[r];
    _words.removeAt(r);
    _dropWord = _word.toString().split('').reversed.join();
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
                      Future.delayed(
                        const Duration(seconds: 1),
                        () {
                          setState(
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Animals(),
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
                      setState(() {});
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
                  'Animals Writing Quiz',
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
                  child: widget.wordCompleted
                      ? Column(
                          children: [
                            if (widget.wordCompleted)
                              Expanded(
                                flex: 2,
                                child: Container(
                                  color: Colors.red,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        _dropWord
                                            .toString()
                                            .split('')
                                            .reversed
                                            .join(),
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 235, 234, 243),
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                              child: Container(
                                child: FlyInAnimation(
                                    animate: true,
                                    child: Image.asset(
                                        'images/${_dropWord.toString().split('').reversed.join()}.png')),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: _word.characters
                                      .map(
                                        (e) => FlyInAnimation(
                                            animate: true,
                                            child: Drag(letter: e)),
                                      )
                                      .toList(),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                color: Colors.lime,
                              ),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                color: Colors.red,
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                              child: Container(
                                child: FlyInAnimation(
                                    animate: true,
                                    child: Image.asset(
                                        'images/${_dropWord.toString().split('').reversed.join()}.png')),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: _word.characters
                                      .map(
                                        (e) => FlyInAnimation(
                                            animate: true,
                                            child: Drag(letter: e)),
                                      )
                                      .toList(),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                color: Colors.lime,
                              ),
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
              print('Accepted');
              return true;
            } else {
              print('Rejected');
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
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              );
            } else {
              return Container(
                color: Colors.amber,
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
                ? SizedBox()
                : Center(
                    child: Draggable(
                      data: widget.letter,
                      onDragEnd: (details) {
                        if (details.wasAccepted) {
                          _accepted = true;
                          setState(() {});
                          Provider.of<Controller>(context, listen: false)
                              .incrementLetters(context: context);
                        }
                      },
                      childWhenDragging: SizedBox(),
                      feedback: Text(
                        widget.letter,
                        style: TextStyle(
                            color: Color.fromARGB(255, 235, 234, 243),
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                offset: Offset(3, 3),
                                color: Colors.black.withOpacity(0.40),
                                blurRadius: 5,
                              ),
                            ]),
                      ),
                      child: Text(
                        widget.letter,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 235, 234, 243),
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
          );
        });
  }
}
