import 'package:arabic_made_easy/alphabet_memory_option.dart';
import 'package:arabic_made_easy/game_manager.dart';
import 'package:arabic_made_easy/second_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MemoryPopupAlphabet extends StatefulWidget {
  const MemoryPopupAlphabet({super.key});

  @override
  State<MemoryPopupAlphabet> createState() => _MemoryPopupAlphabetState();
}

class _MemoryPopupAlphabetState extends State<MemoryPopupAlphabet> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GameManager>(
      builder: (_, notifier, __) => AlertDialog(
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.1,
          MediaQuery.of(context).size.height * 0.2,
          MediaQuery.of(context).size.width * 0.1,
          MediaQuery.of(context).size.height * 0.2,
        ),
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
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Well Done',
                  textAlign: TextAlign.center,
                  style: TextStyle(
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
                    'images/welldone.png',
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
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
                        notifier.reset();
                        Navigator.pushAndRemoveUntil(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (_, __, ___) =>
                                    const AlphabetMemoryOption()),
                            (route) => false);
                      },
                      child: const Text('Replay'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
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
                        notifier.reset();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PageTwo(),
                          ),
                        );
                      },
                      child: const Text('Exit'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
