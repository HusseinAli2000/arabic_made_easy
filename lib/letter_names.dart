import 'package:arabic_made_easy/tts_button_two.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'alphabet_page.dart';
import 'second_page.dart';

class Alphabet extends StatefulWidget {
  const Alphabet({super.key});

  @override
  State<Alphabet> createState() => _AlphabetState();
}

class _AlphabetState extends State<Alphabet> {
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
                              builder: (context) => const AlphabetPage(),
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
              'Alphabet Class',
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
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                padding: const EdgeInsets.all(10),
                children: const [
                  gridTiles(image: 'aa', tts: 'أ', pronunciation: 'Alif'),
                  gridTiles(image: '2', tts: 'ب', pronunciation: 'Baa'),
                  gridTiles(image: '3', tts: 'ت', pronunciation: 'Ta'),
                  gridTiles(image: '4', tts: 'ث', pronunciation: 'Thaa'),
                  gridTiles(image: '5', tts: 'ج', pronunciation: 'Jeem'),
                  gridTiles(image: '6', tts: 'ح', pronunciation: 'Haa'),
                  gridTiles(image: '7', tts: 'خ', pronunciation: 'Khaa'),
                  gridTiles(image: '8', tts: 'د', pronunciation: 'Daal'),
                  gridTiles(image: '9', tts: 'ذ', pronunciation: 'Thaal'),
                  gridTiles(image: '10', tts: 'ر', pronunciation: 'Raa'),
                  gridTiles(image: '11', tts: 'ز', pronunciation: 'Zaa'),
                  gridTiles(image: '12', tts: 'س', pronunciation: 'Seen'),
                  gridTiles(image: '13', tts: 'ش', pronunciation: 'Sheen'),
                  gridTiles(image: '14', tts: 'ص', pronunciation: 'Saad'),
                  gridTiles(image: '15', tts: 'ض', pronunciation: 'Dhaad'),
                  gridTiles(image: '16', tts: 'ط', pronunciation: 'Taa'),
                  gridTiles(image: '17', tts: 'ظ', pronunciation: 'Dhaa'),
                  gridTiles(image: '18', tts: 'ع', pronunciation: 'Ayn'),
                  gridTiles(image: '19', tts: 'غ', pronunciation: 'Ghayn'),
                  gridTiles(image: '20', tts: 'ف', pronunciation: 'Faa'),
                  gridTiles(image: '21', tts: 'ق', pronunciation: 'Qaaf'),
                  gridTiles(image: '22', tts: 'ك', pronunciation: 'Kaaf'),
                  gridTiles(image: '23', tts: 'ل', pronunciation: 'Laam'),
                  gridTiles(image: '24', tts: 'م', pronunciation: 'Meem'),
                  gridTiles(image: '25', tts: 'ن', pronunciation: 'Noon'),
                  gridTiles(image: '26', tts: 'ه', pronunciation: 'Ha'),
                  gridTiles(image: '27', tts: 'و', pronunciation: 'Waaw'),
                  gridTiles(image: '28', tts: 'ي', pronunciation: 'Yaa'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class gridTiles extends StatelessWidget {
  const gridTiles({
    Key? key,
    required this.image,
    required this.tts,
    required this.pronunciation,
  }) : super(key: key);

  final String image;
  final String tts;
  final String pronunciation;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset(
              'images/${image.toLowerCase()}.png',
              color: const Color.fromARGB(255, 235, 234, 243),
              height: 37,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 15,
              ),
              Text(
                pronunciation,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromARGB(255, 235, 234, 243),
                  fontFamily: 'Akaya',
                  fontSize: 18,
                ),
              ),
              TTSButtonTwo(
                word: tts,
                iconSize: 25,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
