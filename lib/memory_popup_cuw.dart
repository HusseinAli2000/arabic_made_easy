import 'package:arabic_made_easy/cuw_memory_option.dart';
import 'package:arabic_made_easy/game_manager.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:arabic_made_easy/second_page.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MemoryPopupCuw extends StatefulWidget {
  const MemoryPopupCuw({super.key});

  @override
  State<MemoryPopupCuw> createState() => _MemoryPopupCuwState();
}

class _MemoryPopupCuwState extends State<MemoryPopupCuw> {
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
                flex: 2,
                child: Image.asset(
                  'images/welldone.png',
                  width: 150,
                  height: 150,
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
                        AudioPlayer().play(
                          AssetSource('spelling/click.mp3'),
                        );
                        Future.delayed(
                          const Duration(milliseconds: 500),
                          () {
                            notifier.reset();
                            Navigator.pushAndRemoveUntil(
                                context,
                                PageRouteBuilder(
                                    pageBuilder: (_, __, ___) =>
                                        const CuwMemoryOption()),
                                (route) => false);
                          },
                        );
                      },
                      child: const Text('New Game'),
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
                        AudioPlayer().play(
                          AssetSource('spelling/click.mp3'),
                        );
                        Future.delayed(
                          const Duration(milliseconds: 500),
                          () {
                            notifier.reset();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PageTwo(),
                              ),
                            );
                          },
                        );
                      },
                      child: const Text('Classes'),
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
