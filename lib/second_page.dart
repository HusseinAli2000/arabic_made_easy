import 'package:flutter/material.dart';
import 'animals.dart';
import 'home_page.dart';
import 'numbers.dart';
import 'alphabet.dart';
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
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              });
            },
            icon: const Icon(
              Icons.arrow_back,
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
              'Arabic Made Easy',
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
                              builder: (context) => const Alphabet(),
                            ),
                          );
                        },
                      );
                    },
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(130, 79, 64, 179),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        SizedBox(
                          width: 15,
                          height: 50,
                        ),
                        Text(
                          'Alphabet',
                          style: TextStyle(
                            color: Color.fromARGB(255, 235, 234, 243),
                            fontFamily: 'Pacifico',
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(0, 255, 255, 255),
                          radius: 20.0,
                          backgroundImage: AssetImage('images/abc.png'),
                        ),
                        SizedBox(
                          width: 17,
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
                        Color.fromARGB(130, 79, 64, 179),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        SizedBox(
                          width: 15,
                          height: 50,
                        ),
                        Text(
                          'Numbers',
                          style: TextStyle(
                            color: Color.fromARGB(255, 235, 234, 243),
                            fontFamily: 'Pacifico',
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(0, 255, 255, 255),
                          radius: 20.0,
                          backgroundImage:
                              AssetImage('images/number-blocks.png'),
                        ),
                        SizedBox(
                          width: 17,
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
                        Color.fromARGB(130, 79, 64, 179),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        SizedBox(
                          width: 15,
                          height: 50,
                        ),
                        Text(
                          'Colors',
                          style: TextStyle(
                            color: Color.fromARGB(255, 235, 234, 243),
                            fontFamily: 'Pacifico',
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(0, 255, 255, 255),
                          radius: 20.0,
                          backgroundImage: AssetImage('images/colors.png'),
                        ),
                        SizedBox(
                          width: 17,
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
                        Color.fromARGB(130, 79, 64, 179),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        SizedBox(
                          width: 15,
                          height: 50,
                        ),
                        Text(
                          'Animals',
                          style: TextStyle(
                            color: Color.fromARGB(255, 235, 234, 243),
                            fontFamily: 'Pacifico',
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(0, 255, 255, 255),
                          radius: 20.0,
                          backgroundImage: AssetImage('images/animals.png'),
                        ),
                        SizedBox(
                          width: 17,
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
                        Color.fromARGB(130, 79, 64, 179),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        SizedBox(
                          width: 15,
                          height: 50,
                        ),
                        Text(
                          'Key Verbs',
                          style: TextStyle(
                            color: Color.fromARGB(255, 235, 234, 243),
                            fontFamily: 'Pacifico',
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(0, 255, 255, 255),
                          radius: 20.0,
                          backgroundImage: AssetImage('images/verbs.png'),
                        ),
                        SizedBox(
                          width: 17,
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
                        Color.fromARGB(130, 79, 64, 179),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        SizedBox(
                          width: 15,
                          height: 50,
                        ),
                        Text(
                          'Basic Phrases',
                          style: TextStyle(
                            color: Color.fromARGB(255, 235, 234, 243),
                            fontFamily: 'Pacifico',
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(0, 255, 255, 255),
                          radius: 20.0,
                          backgroundImage: AssetImage('images/phrases.png'),
                        ),
                        SizedBox(
                          width: 17,
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
                        Color.fromARGB(130, 79, 64, 179),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        SizedBox(
                          width: 15,
                          height: 50,
                        ),
                        Text(
                          'Frequently Used Words',
                          style: TextStyle(
                            color: Color.fromARGB(255, 235, 234, 243),
                            fontFamily: 'Pacifico',
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(0, 255, 255, 255),
                          radius: 20.0,
                          backgroundImage: AssetImage('images/words.png'),
                        ),
                        SizedBox(
                          width: 17,
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
