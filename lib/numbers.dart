import 'package:arabic_made_easy/number_pronunciation.dart';
import 'package:flutter/material.dart';
import 'second_page.dart';

class Numbers extends StatefulWidget {
  const Numbers({super.key});

  @override
  State<Numbers> createState() => _NumbersState();
}

class _NumbersState extends State<Numbers> {
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
                    builder: (context) => const PageTwo(),
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
              'Numbers Class',
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
                              builder: (context) => const NumberPronunciation(),
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
                      children: const [
                        SizedBox(
                          width: 15,
                          height: 50,
                        ),
                        Text(
                          'Numerals',
                          style: TextStyle(
                            color: Color.fromARGB(255, 235, 234, 243),
                            fontFamily: 'Pacifico',
                            fontSize: 20.0,
                          ),
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
                    onPressed: () {},
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(130, 35, 61, 155),
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
                          'Ordinal Numbers',
                          style: TextStyle(
                            color: Color.fromARGB(255, 235, 234, 243),
                            fontFamily: 'Pacifico',
                            fontSize: 20.0,
                          ),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
