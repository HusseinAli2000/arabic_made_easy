import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'animals.dart';
import 'second_page.dart';
import 'tts_button_two.dart';
import 'words.dart';

class AnimalsMulti extends StatefulWidget {
  const AnimalsMulti({Key? key}) : super(key: key);

  @override
  State<AnimalsMulti> createState() => _AnimalsMultiState();
}

class _AnimalsMultiState extends State<AnimalsMulti> {
  final List<String> _words = AnimalWords.toList();
  late String _word;
  late List<String> _options;
  final _random = Random();
  int _score = 0;
  int _questionIndex = 0;
  bool _gameOver = false;

  @override
  void initState() {
    super.initState();
    _words.shuffle(); // Shuffle the list of words.
    _generateQuestion();
  }

  void _generateQuestion() {
    if (_questionIndex == 5) {
      // If all 5 questions have been generated, set the _gameOver flag to true
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
    _questionIndex++;
  }

  void _onOptionSelected(String option) {
    if (_gameOver) {
      // If the game is over, do not allow any more answers to be submitted.
      return;
    }
    if (option == _word) {
      _score++;
    }
    _generateQuestion();
    setState(() {});
  }

  void _showResultsDialog() {
    double percentage = (_score / _questionIndex) * 100;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Game over!'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('You got $_score out of $_questionIndex correct.'),
            SizedBox(height: 16),
            Text('Percentage correct: ${percentage.toStringAsFixed(2)}%'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _score = 0;
              _questionIndex = 0;
              _gameOver = false;
              _words.shuffle(); // Shuffle the list of words.
              _generateQuestion();
              setState(() {});
            },
            child: Text('New game'),
          ),
        ],
      ),
    );
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
              'Animals Multiple Choice Quiz',
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
                    child: Image.asset(
                      'images/$_word.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Expanded(child: TTSButtonTwo(word: _word)),

                  // Generate buttons for each option
                  for (String option in _options)
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _onOptionSelected(option),
                        child: Text(option),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
