import 'dart:math';

import 'package:arabic_made_easy/flashcards_notifier.dart';
import 'package:arabic_made_easy/half_flip_animation.dart';
import 'package:arabic_made_easy/slide_animation.dart';
import 'package:arabic_made_easy/slide_direction.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'dart:math';
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
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final flashCardNotifier =
          Provider.of<FlashCardNotifier>(context, listen: false);
      flashCardNotifier.runSlideCard1();
      flashCardNotifier.generateAllSelectedWord();
      flashCardNotifier.generateCurrentWord();
    });

    super.initState();
  }

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
            child: IgnorePointer(
              ignoring: notifier.ignoreTouches,
              child: Stack(
                children: const [
                  Card2(),
                  Card1(),
                ],
              ),
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
          notifier.setIgnoreTouch(ignore: true);
        },
        child: HalfFlipAnimation(
          animate: notifier.flipCard1,
          reset: notifier.resetFlipCard1,
          flipFromHalfWay: false,
          animationCompleted: (() {
            notifier.resetCard1();
            notifier.runFlipCard2();
          }),
          child: SlideAnimation(
            animationCompleted: () {
              notifier.setIgnoreTouch(ignore: false);
            },
            reset: notifier.resetSlideCard1,
            animate: notifier.slideCard1,
            direction: SlideDirection.upIn,
            child: Center(
              child: SafeArea(
                child: Container(
                  width: 300,
                  height: 400,
                  color: Colors.blue,
                  child: Text(notifier.word1.english),
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
        onHorizontalDragEnd: ((details) {
          print(details.primaryVelocity);
          if (details.primaryVelocity! > 100) {
            notifier.runSwipeCard2(direction: SlideDirection.leftAway);
            notifier.runSlideCard1();
            notifier.setIgnoreTouch(ignore: true);
            notifier.generateCurrentWord();
          }
          if (details.primaryVelocity! < -100) {
            notifier.runSwipeCard2(direction: SlideDirection.rightAway);
            notifier.runSlideCard1();
            notifier.setIgnoreTouch(ignore: false);
            notifier.generateCurrentWord();
          }
        }),
        child: HalfFlipAnimation(
          animate: notifier.flipCard2,
          reset: notifier.resetFlipCard2,
          flipFromHalfWay: true,
          animationCompleted: (() {
            notifier.setIgnoreTouch(ignore: false);
          }),
          child: SlideAnimation(
            animationCompleted: () {
              notifier.resetCard2();
            },
            reset: notifier.resetSwipeCard2,
            animate: notifier.swipeCard2,
            direction: notifier.swipeDirection,
            child: Center(
              child: SafeArea(
                child: Container(
                  width: 300,
                  height: 400,
                  color: Colors.blue,
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(pi),
                    child: Text(
                      notifier.word2.arabic,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
