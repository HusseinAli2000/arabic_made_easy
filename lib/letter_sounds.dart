import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'alphabet_page.dart';
import 'home_page.dart';

class LetterSounds extends StatefulWidget {
  const LetterSounds({super.key});

  @override
  State<LetterSounds> createState() => _LetterSoundsState();
}

class _LetterSoundsState extends State<LetterSounds> {
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
              'Letter Sounds',
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
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset(
                              'images/aa.png',
                              color: const Color.fromARGB(255, 235, 234, 243),
                              height: 37,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.volume_up_rounded,
                              color: Color.fromARGB(255, 235, 234, 243),
                            ),
                            onPressed: () {
                              AudioPlayer().play(
                                AssetSource('letter_sounds/s1.wav'),
                              );
                            },
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
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset(
                              'images/2.png',
                              color: const Color.fromARGB(255, 235, 234, 243),
                              height: 37,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.volume_up_rounded,
                              color: Color.fromARGB(255, 235, 234, 243),
                            ),
                            onPressed: () {
                              AudioPlayer().play(
                                AssetSource('letter_sounds/s2.wav'),
                              );
                            },
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
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset(
                              'images/3.png',
                              color: const Color.fromARGB(255, 235, 234, 243),
                              height: 37,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.volume_up_rounded,
                              color: Color.fromARGB(255, 235, 234, 243),
                            ),
                            onPressed: () {
                              AudioPlayer().play(
                                AssetSource('letter_sounds/s3.wav'),
                              );
                            },
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
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset(
                              'images/4.png',
                              color: const Color.fromARGB(255, 235, 234, 243),
                              height: 37,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.volume_up_rounded,
                              color: Color.fromARGB(255, 235, 234, 243),
                            ),
                            onPressed: () {
                              AudioPlayer().play(
                                AssetSource('letter_sounds/s4.wav'),
                              );
                            },
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
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset(
                              'images/5.png',
                              color: const Color.fromARGB(255, 235, 234, 243),
                              height: 37,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.volume_up_rounded,
                              color: Color.fromARGB(255, 235, 234, 243),
                            ),
                            onPressed: () {
                              AudioPlayer().play(
                                AssetSource('letter_sounds/s5.wav'),
                              );
                            },
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
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset(
                              'images/6.png',
                              color: const Color.fromARGB(255, 235, 234, 243),
                              height: 37,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.volume_up_rounded,
                              color: Color.fromARGB(255, 235, 234, 243),
                            ),
                            onPressed: () {
                              AudioPlayer().play(
                                AssetSource('letter_sounds/s6.wav'),
                              );
                            },
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
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset(
                              'images/7.png',
                              color: const Color.fromARGB(255, 235, 234, 243),
                              height: 37,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.volume_up_rounded,
                              color: Color.fromARGB(255, 235, 234, 243),
                            ),
                            onPressed: () {
                              AudioPlayer().play(
                                AssetSource('letter_sounds/s7.wav'),
                              );
                            },
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
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset(
                              'images/8.png',
                              color: const Color.fromARGB(255, 235, 234, 243),
                              height: 37,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.volume_up_rounded,
                              color: Color.fromARGB(255, 235, 234, 243),
                            ),
                            onPressed: () {
                              AudioPlayer().play(
                                AssetSource('letter_sounds/s8.wav'),
                              );
                            },
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
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset(
                              'images/9.png',
                              color: const Color.fromARGB(255, 235, 234, 243),
                              height: 37,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.volume_up_rounded,
                              color: Color.fromARGB(255, 235, 234, 243),
                            ),
                            onPressed: () {
                              AudioPlayer().play(
                                AssetSource('letter_sounds/s9.wav'),
                              );
                            },
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
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset(
                              'images/10.png',
                              color: const Color.fromARGB(255, 235, 234, 243),
                              height: 37,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.volume_up_rounded,
                              color: Color.fromARGB(255, 235, 234, 243),
                            ),
                            onPressed: () {
                              AudioPlayer().play(
                                AssetSource('letter_sounds/s10.wav'),
                              );
                            },
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
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset(
                              'images/11.png',
                              color: const Color.fromARGB(255, 235, 234, 243),
                              height: 37,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.volume_up_rounded,
                              color: Color.fromARGB(255, 235, 234, 243),
                            ),
                            onPressed: () {
                              AudioPlayer().play(
                                AssetSource('letter_sounds/s11.wav'),
                              );
                            },
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
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset(
                              'images/12.png',
                              color: const Color.fromARGB(255, 235, 234, 243),
                              height: 37,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.volume_up_rounded,
                              color: Color.fromARGB(255, 235, 234, 243),
                            ),
                            onPressed: () {
                              AudioPlayer().play(
                                AssetSource('letter_sounds/s12.wav'),
                              );
                            },
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
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset(
                              'images/13.png',
                              color: const Color.fromARGB(255, 235, 234, 243),
                              height: 37,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.volume_up_rounded,
                              color: Color.fromARGB(255, 235, 234, 243),
                            ),
                            onPressed: () {
                              AudioPlayer().play(
                                AssetSource('letter_sounds/s13.wav'),
                              );
                            },
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
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset(
                              'images/14.png',
                              color: const Color.fromARGB(255, 235, 234, 243),
                              height: 37,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.volume_up_rounded,
                              color: Color.fromARGB(255, 235, 234, 243),
                            ),
                            onPressed: () {
                              AudioPlayer().play(
                                AssetSource('letter_sounds/s14.wav'),
                              );
                            },
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
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset(
                              'images/15.png',
                              color: const Color.fromARGB(255, 235, 234, 243),
                              height: 37,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.volume_up_rounded,
                              color: Color.fromARGB(255, 235, 234, 243),
                            ),
                            onPressed: () {
                              AudioPlayer().play(
                                AssetSource('letter_sounds/s15.wav'),
                              );
                            },
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
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset(
                              'images/16.png',
                              color: const Color.fromARGB(255, 235, 234, 243),
                              height: 37,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.volume_up_rounded,
                              color: Color.fromARGB(255, 235, 234, 243),
                            ),
                            onPressed: () {
                              AudioPlayer().play(
                                AssetSource('letter_sounds/s16.wav'),
                              );
                            },
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
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset(
                              'images/17.png',
                              color: const Color.fromARGB(255, 235, 234, 243),
                              height: 37,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.volume_up_rounded,
                              color: Color.fromARGB(255, 235, 234, 243),
                            ),
                            onPressed: () {
                              AudioPlayer().play(
                                AssetSource('letter_sounds/s17.wav'),
                              );
                            },
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
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset(
                              'images/18.png',
                              color: const Color.fromARGB(255, 235, 234, 243),
                              height: 37,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.volume_up_rounded,
                              color: Color.fromARGB(255, 235, 234, 243),
                            ),
                            onPressed: () {
                              AudioPlayer().play(
                                AssetSource('letter_sounds/s18.wav'),
                              );
                            },
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
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset(
                              'images/19.png',
                              color: const Color.fromARGB(255, 235, 234, 243),
                              height: 37,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.volume_up_rounded,
                              color: Color.fromARGB(255, 235, 234, 243),
                            ),
                            onPressed: () {
                              AudioPlayer().play(
                                AssetSource('letter_sounds/s19.wav'),
                              );
                            },
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
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset(
                              'images/20.png',
                              color: const Color.fromARGB(255, 235, 234, 243),
                              height: 37,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.volume_up_rounded,
                              color: Color.fromARGB(255, 235, 234, 243),
                            ),
                            onPressed: () {
                              AudioPlayer().play(
                                AssetSource('letter_sounds/s20.wav'),
                              );
                            },
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
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset(
                              'images/21.png',
                              color: const Color.fromARGB(255, 235, 234, 243),
                              height: 37,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.volume_up_rounded,
                              color: Color.fromARGB(255, 235, 234, 243),
                            ),
                            onPressed: () {
                              AudioPlayer().play(
                                AssetSource('letter_sounds/s21.wav'),
                              );
                            },
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
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset(
                              'images/22.png',
                              color: const Color.fromARGB(255, 235, 234, 243),
                              height: 37,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.volume_up_rounded,
                              color: Color.fromARGB(255, 235, 234, 243),
                            ),
                            onPressed: () {
                              AudioPlayer().play(
                                AssetSource('letter_sounds/s22.wav'),
                              );
                            },
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
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset(
                              'images/23.png',
                              color: const Color.fromARGB(255, 235, 234, 243),
                              height: 37,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.volume_up_rounded,
                              color: Color.fromARGB(255, 235, 234, 243),
                            ),
                            onPressed: () {
                              AudioPlayer().play(
                                AssetSource('letter_sounds/s23.wav'),
                              );
                            },
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
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset(
                              'images/24.png',
                              color: const Color.fromARGB(255, 235, 234, 243),
                              height: 37,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.volume_up_rounded,
                              color: Color.fromARGB(255, 235, 234, 243),
                            ),
                            onPressed: () {
                              AudioPlayer().play(
                                AssetSource('letter_sounds/s24.wav'),
                              );
                            },
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
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset(
                              'images/25.png',
                              color: const Color.fromARGB(255, 235, 234, 243),
                              height: 37,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.volume_up_rounded,
                              color: Color.fromARGB(255, 235, 234, 243),
                            ),
                            onPressed: () {
                              AudioPlayer().play(
                                AssetSource('letter_sounds/s25.wav'),
                              );
                            },
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
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset(
                              'images/26.png',
                              color: const Color.fromARGB(255, 235, 234, 243),
                              height: 37,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.volume_up_rounded,
                              color: Color.fromARGB(255, 235, 234, 243),
                            ),
                            onPressed: () {
                              AudioPlayer().play(
                                AssetSource('letter_sounds/s26.wav'),
                              );
                            },
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
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset(
                              'images/27.png',
                              color: const Color.fromARGB(255, 235, 234, 243),
                              height: 37,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.volume_up_rounded,
                              color: Color.fromARGB(255, 235, 234, 243),
                            ),
                            onPressed: () {
                              AudioPlayer().play(
                                AssetSource('letter_sounds/s27.wav'),
                              );
                            },
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
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset(
                              'images/28.png',
                              color: const Color.fromARGB(255, 235, 234, 243),
                              height: 37,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.volume_up_rounded,
                              color: Color.fromARGB(255, 235, 234, 243),
                            ),
                            onPressed: () {
                              AudioPlayer().play(
                                AssetSource('letter_sounds/s28.wav'),
                              );
                            },
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
