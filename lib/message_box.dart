import 'package:arabic_made_easy/second_page.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'spelling_controller.dart';

class MessageBox extends StatelessWidget {
  const MessageBox({super.key, required this.sessionCompleted});

  final bool sessionCompleted;

  @override
  Widget build(BuildContext context) {
    String buttonText = 'New Word';
    String content = 'Word Completed';
    String image = 'images/welldone.png';
    if (sessionCompleted) {
      buttonText = 'Back to classes';
      content = 'All Words Completed!';
      image = 'images/completed.png';
    }

    return Consumer<Controller>(
      builder: (_, notifier, __) => AlertDialog(
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
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  content,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Akaya',
                    fontSize: 18,
                    color: Color.fromARGB(255, 235, 234, 243),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    image,
                    width: 100,
                    height: 100,
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
                        if (sessionCompleted) {
                          Provider.of<Controller>(context, listen: false)
                              .reset();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PageTwo(),
                            ),
                          );
                        } else {
                          Provider.of<Controller>(context, listen: false)
                              .requestWord(request: true);
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text(buttonText),
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
}
