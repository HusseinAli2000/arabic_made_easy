import 'package:arabic_made_easy/numbers.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class NumberPronunciation extends StatefulWidget {
  const NumberPronunciation({super.key});

  @override
  State<NumberPronunciation> createState() => _NumberPronunciationState();
}

class _NumberPronunciationState extends State<NumberPronunciation> {
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
                    builder: (context) => const Numbers(),
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
              'Numerals',
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
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                padding: const EdgeInsets.all(10),
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      color: const Color.fromARGB(130, 35, 61, 155),
                      child: Column(
                        children: [
                          const Text(
                            '٠',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 235, 234, 243),
                              fontSize: 30,
                            ),
                          ),
                          const Text(
                            'Zero (0)',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 235, 234, 243),
                              fontSize: 13,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              const Text(
                                'Sifr',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 235, 234, 243),
                                  fontSize: 15,
                                  fontFamily: 'Akaya',
                                ),
                              ),
                              IconButton(
                                iconSize: 20,
                                icon: const Icon(
                                  Icons.volume_up_rounded,
                                  color: Color.fromARGB(255, 235, 234, 243),
                                ),
                                onPressed: () {
                                  AudioPlayer().play(
                                    AssetSource('numbers/n0.wav'),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      color: const Color.fromARGB(130, 35, 61, 155),
                      child: Column(
                        children: [
                          const Text(
                            '١',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 235, 234, 243),
                              fontSize: 30,
                            ),
                          ),
                          const Text(
                            'One (1)',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 235, 234, 243),
                              fontSize: 13,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              const Text(
                                'Wahid',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 235, 234, 243),
                                  fontSize: 15,
                                  fontFamily: 'Akaya',
                                ),
                              ),
                              IconButton(
                                iconSize: 20,
                                icon: const Icon(
                                  Icons.volume_up_rounded,
                                  color: Color.fromARGB(255, 235, 234, 243),
                                ),
                                onPressed: () {
                                  AudioPlayer().play(
                                    AssetSource('numbers/n1.wav'),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      color: const Color.fromARGB(130, 35, 61, 155),
                      child: Column(
                        children: [
                          const Text(
                            '٢',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 235, 234, 243),
                              fontSize: 30,
                            ),
                          ),
                          const Text(
                            'Two (2)',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 235, 234, 243),
                              fontSize: 13,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              const Text(
                                'Ithnan',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 235, 234, 243),
                                  fontSize: 15,
                                  fontFamily: 'Akaya',
                                ),
                              ),
                              IconButton(
                                iconSize: 20,
                                icon: const Icon(
                                  Icons.volume_up_rounded,
                                  color: Color.fromARGB(255, 235, 234, 243),
                                ),
                                onPressed: () {
                                  AudioPlayer().play(
                                    AssetSource('numbers/n2.wav'),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      color: const Color.fromARGB(130, 35, 61, 155),
                      child: Column(
                        children: [
                          const Text(
                            '٣',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 235, 234, 243),
                              fontSize: 30,
                            ),
                          ),
                          const Text(
                            'Three (3)',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 235, 234, 243),
                              fontSize: 13,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              const Text(
                                'Thalatha',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 235, 234, 243),
                                  fontSize: 15,
                                  fontFamily: 'Akaya',
                                ),
                              ),
                              IconButton(
                                iconSize: 20,
                                icon: const Icon(
                                  Icons.volume_up_rounded,
                                  color: Color.fromARGB(255, 235, 234, 243),
                                ),
                                onPressed: () {
                                  AudioPlayer().play(
                                    AssetSource('numbers/n3.wav'),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      color: const Color.fromARGB(130, 35, 61, 155),
                      child: Column(
                        children: [
                          const Text(
                            '٤',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 235, 234, 243),
                              fontSize: 30,
                            ),
                          ),
                          const Text(
                            'Four (4)',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 235, 234, 243),
                              fontSize: 13,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              const Text(
                                'Arbaa',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 235, 234, 243),
                                  fontSize: 15,
                                  fontFamily: 'Akaya',
                                ),
                              ),
                              IconButton(
                                iconSize: 20,
                                icon: const Icon(
                                  Icons.volume_up_rounded,
                                  color: Color.fromARGB(255, 235, 234, 243),
                                ),
                                onPressed: () {
                                  AudioPlayer().play(
                                    AssetSource('numbers/n4.wav'),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      color: const Color.fromARGB(130, 35, 61, 155),
                      child: Column(
                        children: [
                          const Text(
                            '٥',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 235, 234, 243),
                              fontSize: 30,
                            ),
                          ),
                          const Text(
                            'Five (5)',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 235, 234, 243),
                              fontSize: 13,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              const Text(
                                'Khamssa',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 235, 234, 243),
                                  fontSize: 13,
                                  fontFamily: 'Akaya',
                                ),
                              ),
                              IconButton(
                                iconSize: 20,
                                icon: const Icon(
                                  Icons.volume_up_rounded,
                                  color: Color.fromARGB(255, 235, 234, 243),
                                ),
                                onPressed: () {
                                  AudioPlayer().play(
                                    AssetSource('numbers/n5.wav'),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      color: const Color.fromARGB(130, 35, 61, 155),
                      child: Column(
                        children: [
                          const Text(
                            '٦',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 235, 234, 243),
                              fontSize: 30,
                            ),
                          ),
                          const Text(
                            'Six (6)',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 235, 234, 243),
                              fontSize: 13,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              const Text(
                                'Sita',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 235, 234, 243),
                                  fontSize: 15,
                                  fontFamily: 'Akaya',
                                ),
                              ),
                              IconButton(
                                iconSize: 20,
                                icon: const Icon(
                                  Icons.volume_up_rounded,
                                  color: Color.fromARGB(255, 235, 234, 243),
                                ),
                                onPressed: () {
                                  AudioPlayer().play(
                                    AssetSource('numbers/n6.wav'),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      color: const Color.fromARGB(130, 35, 61, 155),
                      child: Column(
                        children: [
                          const Text(
                            '٧',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 235, 234, 243),
                              fontSize: 30,
                            ),
                          ),
                          const Text(
                            'Seven (7)',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 235, 234, 243),
                              fontSize: 13,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              const Text(
                                'Sabaa',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 235, 234, 243),
                                  fontSize: 15,
                                  fontFamily: 'Akaya',
                                ),
                              ),
                              IconButton(
                                iconSize: 20,
                                icon: const Icon(
                                  Icons.volume_up_rounded,
                                  color: Color.fromARGB(255, 235, 234, 243),
                                ),
                                onPressed: () {
                                  AudioPlayer().play(
                                    AssetSource('numbers/n7.wav'),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      color: const Color.fromARGB(130, 35, 61, 155),
                      child: Column(
                        children: [
                          const Text(
                            '٨',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 235, 234, 243),
                              fontSize: 30,
                            ),
                          ),
                          const Text(
                            'Eight (8)',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 235, 234, 243),
                              fontSize: 13,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              const Text(
                                'Thamanya',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 235, 234, 243),
                                  fontSize: 11,
                                  fontFamily: 'Akaya',
                                ),
                              ),
                              IconButton(
                                iconSize: 20,
                                icon: const Icon(
                                  Icons.volume_up_rounded,
                                  color: Color.fromARGB(255, 235, 234, 243),
                                ),
                                onPressed: () {
                                  AudioPlayer().play(
                                    AssetSource('numbers/n8.wav'),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      color: const Color.fromARGB(130, 35, 61, 155),
                      child: Column(
                        children: [
                          const Text(
                            '٩',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 235, 234, 243),
                              fontSize: 30,
                            ),
                          ),
                          const Text(
                            'Nine (9)',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 235, 234, 243),
                              fontSize: 13,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              const Text(
                                'Tissaa',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 235, 234, 243),
                                  fontSize: 15,
                                  fontFamily: 'Akaya',
                                ),
                              ),
                              IconButton(
                                iconSize: 20,
                                icon: const Icon(
                                  Icons.volume_up_rounded,
                                  color: Color.fromARGB(255, 235, 234, 243),
                                ),
                                onPressed: () {
                                  AudioPlayer().play(
                                    AssetSource('numbers/n9.wav'),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      color: const Color.fromARGB(130, 35, 61, 155),
                      child: Column(
                        children: [
                          const Text(
                            '١٠',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 235, 234, 243),
                              fontSize: 30,
                            ),
                          ),
                          const Text(
                            'Ten (10)',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 235, 234, 243),
                              fontSize: 13,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              const Text(
                                'Ashra',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 235, 234, 243),
                                  fontSize: 15,
                                  fontFamily: 'Akaya',
                                ),
                              ),
                              IconButton(
                                iconSize: 20,
                                icon: const Icon(
                                  Icons.volume_up_rounded,
                                  color: Color.fromARGB(255, 235, 234, 243),
                                ),
                                onPressed: () {
                                  AudioPlayer().play(
                                    AssetSource('numbers/n10.wav'),
                                  );
                                },
                              ),
                            ],
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
    );
  }
}
