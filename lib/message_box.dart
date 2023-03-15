import 'package:arabic_made_easy/animals_spelling.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'spelling_controller.dart';

class MessageBox extends StatelessWidget {
  const MessageBox({super.key, required this.sessionCompleted});

  final bool sessionCompleted;

  @override
  Widget build(BuildContext context) {
    String title = 'Well Done!';
    String buttonText = 'New Word';
    if (sessionCompleted) {
      title = 'All Words Completed!';
      buttonText = 'Replay';
    }

    return Consumer<Controller>(
      builder: (_, notifier, __) => AlertDialog(
        title: Text(title),
        content: Text('The word put together is '),
        actions: [
          ElevatedButton(
              onPressed: () {
                if (sessionCompleted) {
                  Provider.of<Controller>(context, listen: false).reset();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AnimalsSpelling(
                        wordCompleted: true,
                      ),
                    ),
                  );
                } else {
                  Provider.of<Controller>(context, listen: false)
                      .requestWord(request: true);
                  Navigator.of(context).pop();
                }
              },
              child: Text(buttonText))
        ],
      ),
    );
  }
}
