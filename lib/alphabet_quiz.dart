import 'package:flutter/material.dart';
import 'alphabet_page.dart';

class AlphabetQuiz extends StatefulWidget {
  const AlphabetQuiz({super.key});

  @override
  State<AlphabetQuiz> createState() => _AlphabetQuizState();
}

class _AlphabetQuizState extends State<AlphabetQuiz> {
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
                    builder: (context) => const AlphabetPage(),
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
              'Alphabet Quiz',
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
                    onPressed: () {},
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
                          height: 50,
                        ),
                        const Text(
                          'Easy',
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
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
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
                          height: 50,
                        ),
                        const Text(
                          'Medium',
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
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
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
                          height: 50,
                        ),
                        const Text(
                          'Hard',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
