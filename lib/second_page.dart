import 'package:arabic_made_easy/shapes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'alphabet_page.dart';
import 'animals.dart';
import 'database_manager.dart';
import 'flashcards_notifier.dart';
import 'language_button_notifier.dart';
import 'main_page.dart';
import 'numbers.dart';
import 'key_verbs.dart';
import 'fuv.dart';
import 'basic_sentences.dart';
import 'colors.dart';
import 'review_page.dart';
import 'settings_page.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
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
                        FirebaseAuth.instance.signOut();
                        setState(
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainPage(),
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
                        Provider.of<FlashCardNotifier>(context, listen: false)
                            .setTopic(topic: 'Review');
                        notifier.reset();
                        DatabaseManager().selectWord().then((words) {
                          final reviewNotifier =
                              Provider.of<LanguageButtonNotifier>(context,
                                  listen: false);
                          if (words.isEmpty) {
                            reviewNotifier.disableButtons(disable: true);
                          } else {
                            reviewNotifier.disableButtons(disable: false);
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ReviewPage(),
                            ),
                          );
                        });
                      },
                    );
                  } else if (index == 2) {
                    Future.delayed(
                      const Duration(milliseconds: 500),
                      () {
                        setState(
                          () {
                            notifier.reset();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SettingsPage(),
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
                    icon: Icons.logout,
                    text: 'Sign Out',
                  ),
                  GButton(
                    icon: Icons.reviews,
                    text: 'Review Quizzes',
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
                'Classes',
                style: TextStyle(
                  fontFamily: 'Akaya',
                  fontSize: 30,
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
                            setState(
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const AlphabetPage(),
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
                                'Alphabet',
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
                                'images/abc.png',
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
                            setState(
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Numbers(),
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
                                'Numbers',
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
                                'images/number-blocks.png',
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
                            setState(
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ColorsPage(),
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
                                'Colors',
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
                                'images/colors.png',
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
                                'Animals',
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
                                'images/animals.png',
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
                            setState(
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Shapes(),
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
                                'Shapes',
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
                                'images/shapes.png',
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
                          onPressed: () {},
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
                                'Body Parts',
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
                                'images/human-body.png',
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
                          onPressed: () {},
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
                            setState(
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const KeyVerbs(),
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
                                'Key Verbs',
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
                                'images/verbs.png',
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
                            setState(
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const BasicSentences(),
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
                                'Basic Phrases',
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
                                'images/phrases.png',
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
                            setState(
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const FUV(),
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
                                'Commonly Used Words',
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
                                'images/words.png',
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
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
