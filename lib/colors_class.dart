import 'package:arabic_made_easy/colors.dart';
import 'package:arabic_made_easy/tts_button_two.dart';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'second_page.dart';

class ColorsClass extends StatefulWidget {
  const ColorsClass({super.key});

  @override
  State<ColorsClass> createState() => _ColorsClassState();
}

class _ColorsClassState extends State<ColorsClass> {
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
                  Future.delayed(
                    const Duration(seconds: 1),
                    () {
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
              'Colors',
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
                crossAxisCount: 2,
                mainAxisSpacing: 25,
                crossAxisSpacing: 25,
                padding: const EdgeInsets.all(10),
                children: const [
                  gridTile(
                    color: Colors.black,
                    arabic: 'أسود',
                    english: 'Black',
                    pronunciation: 'Aswad',
                    TTS: 'أسود',
                    content1: Colors.white,
                    content2: Colors.white,
                    content3: Colors.white,
                  ),
                  gridTile(
                    color: Colors.white,
                    arabic: 'أبيض',
                    english: 'ًWhite',
                    pronunciation: 'Abyad',
                    TTS: 'أبيض',
                    content1: Colors.black,
                    content2: Colors.black,
                    content3: Colors.black,
                  ),
                  gridTile(
                    color: Colors.red,
                    arabic: 'أحمر',
                    english: 'Red',
                    pronunciation: 'Ahmar',
                    TTS: 'أحمر',
                    content1: Colors.white,
                    content2: Colors.white,
                    content3: Colors.white,
                  ),
                  gridTile(
                    color: Colors.blue,
                    arabic: 'أزرق',
                    english: 'Blue',
                    pronunciation: 'Azraq',
                    TTS: 'أزرق',
                    content1: Colors.white,
                    content2: Colors.white,
                    content3: Colors.white,
                  ),
                  gridTile(
                    color: Colors.green,
                    arabic: 'أخضر',
                    english: 'Green',
                    pronunciation: 'Akhdar',
                    TTS: 'أخضر',
                    content1: Colors.white,
                    content2: Colors.white,
                    content3: Colors.white,
                  ),
                  gridTile(
                    color: Colors.orange,
                    arabic: 'برتقالي',
                    english: 'Orange',
                    pronunciation: 'Burtuqali',
                    TTS: 'برتقالي',
                    content1: Colors.white,
                    content2: Colors.white,
                    content3: Colors.white,
                  ),
                  gridTile(
                    color: Colors.pink,
                    arabic: 'بمبي',
                    english: 'Pink',
                    pronunciation: 'Bambi',
                    TTS: 'بمبي',
                    content1: Colors.white,
                    content2: Colors.white,
                    content3: Colors.white,
                  ),
                  gridTile(
                    color: Colors.purple,
                    arabic: 'بنفسجي',
                    english: 'Purple',
                    pronunciation: 'Banafsaji',
                    TTS: 'بنفسجي',
                    content1: Colors.white,
                    content2: Colors.white,
                    content3: Colors.white,
                  ),
                  gridTile(
                    color: Colors.yellow,
                    arabic: 'أصفر',
                    english: 'Yellow',
                    pronunciation: 'Asfar',
                    TTS: 'أصفر',
                    content1: Colors.black,
                    content2: Colors.black,
                    content3: Colors.black,
                  ),
                  gridTile(
                    color: Colors.brown,
                    arabic: 'بني',
                    english: 'Brown',
                    pronunciation: 'Bunni',
                    TTS: 'بني',
                    content1: Colors.white,
                    content2: Colors.white,
                    content3: Colors.white,
                  ),
                  gridTile(
                    color: Colors.grey,
                    arabic: 'رمادي',
                    english: 'Grey',
                    pronunciation: 'Ramadi',
                    TTS: 'رمادي',
                    content1: Colors.white,
                    content2: Colors.white,
                    content3: Colors.white,
                  ),
                  gridTile(
                    color: Colors.amber,
                    arabic: 'عنبر',
                    english: 'Amber',
                    pronunciation: 'Anbar',
                    TTS: 'عنبر',
                    content1: Colors.black,
                    content2: Colors.black,
                    content3: Colors.black,
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

class gridTile extends StatelessWidget {
  const gridTile({
    Key? key,
    required this.color,
    required this.arabic,
    required this.english,
    required this.pronunciation,
    required this.TTS,
    required this.content1,
    required this.content2,
    required this.content3,
  }) : super(key: key);

  final Color color;
  final String arabic;
  final String english;
  final String pronunciation;
  final String TTS;
  final Color content1;
  final Color content2;
  final Color content3;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              arabic,
              style: TextStyle(
                color: content1,
                fontFamily: 'Akaya',
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              english,
              style: TextStyle(
                color: content2,
                fontFamily: 'Akaya',
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 15,
                ),
                Text(
                  pronunciation,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: content3,
                    fontFamily: 'Akaya',
                    fontSize: 16,
                  ),
                ),
                TTSButtonTwo(
                  word: TTS,
                  iconSize: 25,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
