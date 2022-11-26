import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'alphabet_page.dart';
import 'animals.dart';
import 'home_page.dart';
import 'main_page.dart';
import 'numbers.dart';
import 'key_verbs.dart';
import 'fuv.dart';
import 'basic_sentences.dart';
import 'colors.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainPage(),
                  ),
                );
              });
            },
            icon: const Icon(
              Icons.logout,
              color: Color.fromARGB(255, 235, 234, 243),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Icon(
                  Icons.settings,
                  color: Color.fromARGB(255, 235, 234, 243),
                ),
              ),
            ),
          ],
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
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
                          height: 50,
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
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
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
                          height: 50,
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
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
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
                          height: 50,
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
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
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
                          height: 50,
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
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
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
                          height: 50,
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
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BasicSentences(),
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
                          width: 10,
                          height: 50,
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
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
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
                          height: 50,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
