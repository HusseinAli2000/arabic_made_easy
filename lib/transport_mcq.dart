import 'package:arabic_made_easy/second_page.dart';
import 'package:arabic_made_easy/transport.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'transport_mcq_five.dart';
import 'transport_mcq_ten.dart';

class TransportMcq extends StatefulWidget {
  const TransportMcq({super.key});

  @override
  State<TransportMcq> createState() => _TransportMcqState();
}

class _TransportMcqState extends State<TransportMcq> {
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
                  AudioPlayer().play(
                    AssetSource('spelling/click.mp3'),
                  );
                  Future.delayed(
                    const Duration(milliseconds: 500),
                    () {
                      setState(
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Transport(),
                            ),
                          );
                        },
                      );
                    },
                  );
                } else if (index == 1) {
                  AudioPlayer().play(
                    AssetSource('spelling/click.mp3'),
                  );
                  Future.delayed(
                    const Duration(milliseconds: 500),
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
              'Transport Quiz',
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
                child: ListView(
              children: [
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
                        AudioPlayer().play(
                          AssetSource('spelling/click.mp3'),
                        );
                        Future.delayed(
                          const Duration(milliseconds: 500),
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TransportMcqFive(),
                              ),
                            );
                          },
                        );
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
                            '5 Multiple Choice Questions',
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
                        AudioPlayer().play(
                          AssetSource('spelling/click.mp3'),
                        );
                        Future.delayed(
                          const Duration(milliseconds: 500),
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TransportMcqTen(),
                              ),
                            );
                          },
                        );
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
                            '10 Multiple Choice Questions',
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
              ],
            )),
          ),
        ),
      ),
    );
  }
}
