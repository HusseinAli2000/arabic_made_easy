import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'animals.dart';
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

  @override
  void initState() {
    super.initState();
    _generateQuestion();
  }

  void _generateQuestion() {
    _word = _words[_random.nextInt(_words.length)];
    _options = [_word];
    while (_options.length < 4) {
      String randomWord = _words[_random.nextInt(_words.length)];
      if (randomWord != _word && !_options.contains(randomWord)) {
        _options.add(randomWord);
      }
    }
    _options.shuffle();
  }

  void _onOptionSelected(String option) {
    // Check if the selected option is correct
    if (option == _word) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Correct!'),
          content: Text('You got it right.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _generateQuestion();
                setState(() {});
              },
              child: Text('Next question'),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Incorrect'),
          content: Text('Sorry, that was not the correct answer.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Try again'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // Navigation bar code omitted for brevity
        appBar: AppBar(
            // AppBar code omitted for brevity
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TTSButtonTwo(word: _word),
                        SizedBox(height: 32),
                        // Generate buttons for each option
                        for (String option in _options)
                          ElevatedButton(
                            onPressed: () => _onOptionSelected(option),
                            child: Text(option),
                          ),
                      ],
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
