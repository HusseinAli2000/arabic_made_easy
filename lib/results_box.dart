import 'package:arabic_made_easy/animals_quiz.dart';
import 'package:arabic_made_easy/database_manager.dart';
import 'package:arabic_made_easy/flashcards_notifier.dart';
import 'package:arabic_made_easy/quick_box.dart';
import 'package:arabic_made_easy/second_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultsBox extends StatefulWidget {
  const ResultsBox({super.key});

  @override
  State<ResultsBox> createState() => _ResultsBoxState();
}

class _ResultsBoxState extends State<ResultsBox> {
  bool _haveSavedCards = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<FlashCardNotifier>(
      builder: (_, notifier, __) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: const Color.fromARGB(130, 35, 61, 155),
        title: notifier.isSessionCompleted
            ? const Text(
                'Session completed!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 235, 234, 243),
                  fontFamily: 'Akaya',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              )
            : const Text(
                'Round Completed!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 235, 234, 243),
                  fontFamily: 'Akaya',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
        actions: [
          Table(
            columnWidths: const {
              0: FlexColumnWidth(3),
              1: FlexColumnWidth(1),
            },
            children: [
              buildTableRow(
                  title: 'Total Rounds ', stat: notifier.roundTally.toString()),
              buildTableRow(
                  title: 'No. Cards ', stat: notifier.cardTally.toString()),
              buildTableRow(
                  title: 'No. Correct ',
                  stat: notifier.correctTally.toString()),
              buildTableRow(
                  title: 'No. Incorrect ',
                  stat: notifier.incorrectTally.toString()),
              buildTableRow(
                  title: 'Correct Percentage ',
                  stat: '${notifier.correctPercentage.toString()}%'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                notifier.isSessionCompleted
                    ? const SizedBox()
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(color: Colors.white),
                          ),
                          backgroundColor: const Color.fromARGB(161, 6, 12, 58),
                          textStyle: const TextStyle(
                            color: Color.fromARGB(255, 235, 234, 243),
                            fontFamily: 'Akaya',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AnimalsQuiz(),
                            ),
                          );
                        },
                        child: const Text('Retest Incorrect Cards'),
                      ),
                notifier.isSessionCompleted
                    ? const SizedBox()
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(color: Colors.white),
                          ),
                          backgroundColor: const Color.fromARGB(161, 6, 12, 58),
                          textStyle: const TextStyle(
                            color: Color.fromARGB(255, 235, 234, 243),
                            fontFamily: 'Akaya',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: _haveSavedCards
                            ? null
                            : () async {
                                for (int i = 0;
                                    i < notifier.incorrectCards.length;
                                    i++) {
                                  await DatabaseManager().insertWord(
                                      word: notifier.incorrectCards[i]);
                                  final words =
                                      await DatabaseManager().selectWord();
                                }
                                _haveSavedCards = true;
                                runQuickBox(
                                    context: context,
                                    text: 'Incorrect Cards Saved!');
                                setState(() {});
                              },
                        child: const Text('Save Incorrect Cards'),
                      ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: Colors.white)),
                    backgroundColor: const Color.fromARGB(161, 6, 12, 58),
                    textStyle: const TextStyle(
                      color: Color.fromARGB(255, 235, 234, 243),
                      fontFamily: 'Akaya',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    notifier.reset();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PageTwo(),
                      ),
                    );
                  },
                  child: const Text('Back to Classes'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  TableRow buildTableRow({required String title, required String stat}) {
    return TableRow(
      children: [
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                color: Color.fromARGB(255, 235, 234, 243),
                fontFamily: 'Akaya',
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              stat,
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: Color.fromARGB(255, 235, 234, 243),
                fontFamily: 'Akaya',
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  runQuickBox({required String text, required BuildContext context}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => QuickBox(text: text),
    );
    Future.delayed(const Duration(milliseconds: 1000), () {
      Navigator.maybePop(context);
    });
  }
}
