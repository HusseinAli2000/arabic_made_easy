import 'dart:math';

import 'package:arabic_made_easy/second_page.dart';
import 'package:arabic_made_easy/transport_mcq.dart';
import 'package:arabic_made_easy/tts_button_two.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'words.dart';

class TransportMcqTen extends StatefulWidget {
  const TransportMcqTen({super.key});

  @override
  State<TransportMcqTen> createState() => _TransportMcqTenState();
}

class _TransportMcqTenState extends State<TransportMcqTen> {
  final List<String> _words = TransportWordsMulti.toList();
  late String _word;
  late List<String> _options;
  late List<Color> _optionsColor;
  final _random = Random();
  int _score = 0;
  int _questionIndex = 0;
  bool _gameOver = false;
  double _progress = 0;
  bool _answeringQuestion = false;

  @override
  void initState() {
    super.initState();
    _words.shuffle(); // Shuffle the list of words.
    _generateQuestion();
  }

  void _generateQuestion() {
    if (_questionIndex == 10) {
      // If all 10 questions have been generated, set the _gameOver flag to true
      // so that the game does not continue to generate new questions.
      _gameOver = true;
      _showResultsDialog();
      return;
    }
    _word = _words[_questionIndex];
    _options = [_word];
    while (_options.length < 4) {
      String randomWord = _words[_random.nextInt(_words.length)];
      if (randomWord != _word && !_options.contains(randomWord)) {
        _options.add(randomWord);
      }
    }
    _options.shuffle();
    _optionsColor =
        List<Color>.filled(4, const Color.fromARGB(255, 35, 61, 155));
    _questionIndex++;
    _answeringQuestion = true;
  }

  Future<void> _onOptionSelected(String option) async {
    if (_gameOver || !_answeringQuestion) {
      // If the game is over or the question is not currently being answered,
      // do not allow any more answers to be submitted.
      return;
    }
    _answeringQuestion = false;
    int selectedIndex = _options.indexOf(option);
    if (option == _word) {
      AudioPlayer().play(
        AssetSource('spelling/correct.mp3'),
      ); // play correct sound
      _optionsColor[selectedIndex] = Colors.green;
      _score++;
    } else {
      AudioPlayer().play(
        AssetSource('spelling/incorrect.mp3'),
      ); // play wrong sound
      _optionsColor[selectedIndex] = Colors.red;
      _optionsColor[_options.indexOf(_word)] = Colors.green;
    }
    setState(() {});

    // Wait for 2 seconds before generating the next question and highlighting
    // the correct option.
    await Future.delayed(const Duration(seconds: 3));

    _optionsColor = List<Color>.filled(4, Colors.grey);
    _generateQuestion();

    setState(() {
      _progress += 0.1;
    });
  }

  void _showResultsDialog() {
    double percentage = (_score / _questionIndex) * 100;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: const EdgeInsets.all(0),
        insetPadding: const EdgeInsets.fromLTRB(90, 170, 90, 190),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Container(
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  'You got $_score out of $_questionIndex correct.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Akaya',
                    fontSize: 18,
                    color: Color.fromARGB(255, 235, 234, 243),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  'Percentage correct: ${percentage.toStringAsFixed(2)}%',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Akaya',
                    fontSize: 18,
                    color: Color.fromARGB(255, 235, 234, 243),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.only(left: 50, right: 50),
                        backgroundColor: const Color.fromARGB(130, 35, 61, 155),
                        textStyle: const TextStyle(
                          color: Color.fromARGB(255, 235, 234, 243),
                          fontFamily: 'Akaya',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        _progress = 0;
                        Navigator.pop(context);
                        _score = 0;
                        _questionIndex = 0;
                        _gameOver = false;
                        _words.shuffle(); // Shuffle the list of words.
                        _generateQuestion();
                        setState(() {});
                      },
                      child: const Text('New Quiz'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getOptionColor(int index) {
    return _optionsColor[index];
  }

  @override
  Widget build(BuildContext context) {
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
                    const Duration(milliseconds: 500),
                    () {
                      setState(
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TransportMcq(),
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
              '10 Transport Multiple Choice Quiz',
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Image.asset(
                        'images/${_word.replaceAll(' ', '').toLowerCase()}.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TTSButtonTwo(
                      word: _word,
                    ),
                  ),
                  // Generate buttons for each option
                  for (int i = 0; i < _options.length; i++)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ElevatedButton(
                            onPressed: () => _onOptionSelected(_options[i]),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(_optionsColor[i]),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                            child: Text(
                              _options[i],
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 20, 15, 30),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: LinearProgressIndicator(
                        value: _progress,
                        minHeight: 20,
                        color: const Color.fromARGB(255, 35, 61, 155),
                        backgroundColor:
                            const Color.fromARGB(255, 235, 234, 243),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
