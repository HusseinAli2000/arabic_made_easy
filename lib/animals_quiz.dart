import 'package:arabic_made_easy/flashcards_notifier.dart';
import 'package:arabic_made_easy/half_flip_animation.dart';
import 'package:arabic_made_easy/slide_animation.dart';
import 'package:arabic_made_easy/slide_direction.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'animals.dart';
import 'second_page.dart';
import 'package:provider/provider.dart';

class AnimalsQuiz extends StatefulWidget {
  const AnimalsQuiz({super.key});

  @override
  State<AnimalsQuiz> createState() => _AnimalsQuizState();
}

class _AnimalsQuizState extends State<AnimalsQuiz> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FlashCardNotifier>(
      builder: (_, notifier, __) => MaterialApp(
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
                'Animals Quiz',
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
            child: Stack(
              children: const [
                Card2(),
                Card1(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Card1 extends StatelessWidget {
  const Card1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FlashCardNotifier>(
      builder: (_, notifier, __) => GestureDetector(
        onDoubleTap: () {
          notifier.runFlipCard1();
        },
        child: HalfFlipAnimation(
          animate: notifier.flipCard1,
          reset: false,
          flipFromHalfWay: false,
          animationCompleted: (() {
            notifier.runFlipCard2();
          }),
          child: SlideAnimation(
            direction: SlideDirection.upIn,
            child: Center(
              child: SafeArea(
                child: Container(
                  width: 300,
                  height: 400,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Card2 extends StatelessWidget {
  const Card2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FlashCardNotifier>(
      builder: (_, notifier, __) => GestureDetector(
        child: HalfFlipAnimation(
          animate: notifier.flipCard2,
          reset: false,
          flipFromHalfWay: true,
          animationCompleted: (() {
            print('flip 2 completed');
          }),
          child: SlideAnimation(
            direction: SlideDirection.upIn,
            child: Center(
              child: SafeArea(
                child: Container(
                  width: 300,
                  height: 400,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
