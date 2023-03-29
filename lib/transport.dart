import 'package:arabic_made_easy/game_manager.dart';
import 'package:arabic_made_easy/transport_class.dart';
import 'package:arabic_made_easy/transport_flashcards.dart';
import 'package:arabic_made_easy/transport_mcq.dart';
import 'package:arabic_made_easy/transport_memory_option.dart';
import 'package:arabic_made_easy/transport_spelling.dart';
import 'package:flutter/material.dart';
import 'package:arabic_made_easy/second_page.dart';

import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:provider/provider.dart';

import 'flashcards_notifier.dart';
import 'spelling_controller.dart';

class Transport extends StatefulWidget {
  const Transport({super.key});

  @override
  State<Transport> createState() => _TransportState();
}

class _TransportState extends State<Transport> {
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
                              builder: (context) => const PageTwo(),
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
              'Transport Class',
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
              child: Consumer<GameManager>(
                builder: (_, notifier, __) => ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(3, 8, 3, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TransportClass(),
                            ),
                          );
                        },
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(130, 35, 61, 155),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                              width: 10,
                              height: 70,
                            ),
                            const Text(
                              'Transport',
                              style: TextStyle(
                                color: Color.fromARGB(255, 235, 234, 243),
                                fontFamily: 'Pacifico',
                                fontSize: 20.0,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Image.asset(
                              'images/transportation.png',
                              height: 35,
                              width: 35,
                            ),
                            const SizedBox(
                              width: 10,
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(3, 8, 3, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(
                            () {
                              Provider.of<FlashCardNotifier>(context,
                                      listen: false)
                                  .setTopic(topic: 'Transport');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const TransportFlashcards(),
                                ),
                              );
                            },
                          );
                        },
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(130, 35, 61, 155),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                              width: 13,
                              height: 70,
                            ),
                            const Text(
                              'Quiz',
                              style: TextStyle(
                                color: Color.fromARGB(255, 235, 234, 243),
                                fontFamily: 'Pacifico',
                                fontSize: 20.0,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Image.asset(
                              'images/quiz.png',
                              height: 35,
                              width: 35,
                            ),
                            const SizedBox(
                              width: 10,
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(3, 8, 3, 0),
                      child: Container(
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
                        child: ElevatedButton(
                          onPressed: () {
                            notifier.reset();
                            Navigator.pushAndRemoveUntil(
                                context,
                                PageRouteBuilder(
                                    pageBuilder: (_, __, ___) =>
                                        TransportMemoryOption()),
                                (route) => false);
                          },
                          style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            backgroundColor: const MaterialStatePropertyAll(
                              Color.fromARGB(130, 35, 61, 155),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(
                                width: 10,
                                height: 70,
                              ),
                              const Text(
                                'Memory Cards Game',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 235, 234, 243),
                                  fontFamily: 'Pacifico',
                                  fontSize: 20.0,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Image.asset(
                                'images/quiz.png',
                                height: 35,
                                width: 35,
                              ),
                              const SizedBox(
                                width: 10,
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(3, 8, 3, 0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(
                            () {
                              Provider.of<Controller>(context, listen: false)
                                  .reset();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const TransportSpelling(),
                                ),
                              );
                            },
                          );
                        },
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(130, 35, 61, 155),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                              width: 13,
                              height: 70,
                            ),
                            const Text(
                              'Writing Quiz',
                              style: TextStyle(
                                color: Color.fromARGB(255, 235, 234, 243),
                                fontFamily: 'Pacifico',
                                fontSize: 20.0,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Image.asset(
                              'images/quiz.png',
                              height: 35,
                              width: 35,
                            ),
                            const SizedBox(
                              width: 10,
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(3, 8, 3, 0),
                      child: ElevatedButton(
                        onPressed: () {
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
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(130, 35, 61, 155),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                              width: 13,
                              height: 70,
                            ),
                            const Text(
                              'Multiple Choice Quiz',
                              style: TextStyle(
                                color: Color.fromARGB(255, 235, 234, 243),
                                fontFamily: 'Pacifico',
                                fontSize: 20.0,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Image.asset(
                              'images/quiz.png',
                              height: 35,
                              width: 35,
                            ),
                            const SizedBox(
                              width: 10,
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
