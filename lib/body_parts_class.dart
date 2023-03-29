import 'package:arabic_made_easy/body_parts.dart';

import 'package:arabic_made_easy/tts_button_two.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'second_page.dart';

class BodyPartsClass extends StatefulWidget {
  const BodyPartsClass({super.key});

  @override
  State<BodyPartsClass> createState() => _BodyPartsClassState();
}

class _BodyPartsClassState extends State<BodyPartsClass> {
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
                              builder: (context) => const BodyParts(),
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
              'Body Parts',
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
                  gridTiles(
                      arabic: 'رأس', english: 'Head', pronunciation: 'Raass'),
                  gridTiles(
                      arabic: 'عين', english: 'Eye', pronunciation: 'Ayn'),
                  gridTiles(
                      arabic: 'أذن', english: 'Ear', pronunciation: 'Udhun'),
                  gridTiles(
                      arabic: 'أنف', english: 'Nose', pronunciation: 'Anf'),
                  gridTiles(
                      arabic: 'فم', english: 'Mouth', pronunciation: 'Fam'),
                  gridTiles(
                      arabic: 'شفة', english: 'Lips', pronunciation: 'Shafa'),
                  gridTiles(
                      arabic: 'لسان',
                      english: 'Tongue',
                      pronunciation: 'Lisan'),
                  gridTiles(
                      arabic: 'أسنان ',
                      english: 'Teeth',
                      pronunciation: 'Asnan'),
                  gridTiles(
                      arabic: 'رقبة', english: 'Neck', pronunciation: 'Raqaba'),
                  gridTiles(
                      arabic: 'كتف',
                      english: 'Shoulder',
                      pronunciation: 'Katif'),
                  gridTiles(
                      arabic: 'صدر', english: 'Chest', pronunciation: 'Sadr'),
                  gridTiles(
                      arabic: 'بطن', english: 'Stomach', pronunciation: 'Batn'),
                  gridTiles(
                      arabic: 'ظهر', english: 'Back', pronunciation: 'Dhahr'),
                  gridTiles(
                      arabic: 'ذراع', english: 'Arm', pronunciation: 'Dhiraa'),
                  gridTiles(
                      arabic: 'يد', english: 'Hand', pronunciation: 'Yad'),
                  gridTiles(
                      arabic: 'إصبع',
                      english: 'Finger',
                      pronunciation: 'Issbaa'),
                  gridTiles(
                      arabic: 'ساق', english: 'Leg', pronunciation: 'Saaq'),
                  gridTiles(
                      arabic: 'ركبة', english: 'Knee', pronunciation: 'Rukba'),
                  gridTiles(
                      arabic: 'قدم ', english: 'Foot', pronunciation: 'Qadam'),
                  gridTiles(
                      arabic: 'أصبع القدم',
                      english: 'Toe',
                      pronunciation: 'Issbaa Al-Qadam'),
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
    required this.arabic,
    required this.english,
    required this.pronunciation,
  }) : super(key: key);

  final String arabic;
  final String english;
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
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(
              'images/${english.toLowerCase()}.png',
              height: 40,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
              arabic,
              style: const TextStyle(
                color: Color.fromARGB(255, 235, 234, 243),
                fontFamily: 'Akaya',
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
              english,
              style: const TextStyle(
                color: Color.fromARGB(255, 235, 234, 243),
                fontFamily: 'Akaya',
                fontSize: 14,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 12,
              ),
              Text(
                pronunciation,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromARGB(255, 235, 234, 243),
                  fontFamily: 'Akaya',
                  fontSize: 14,
                ),
              ),
              TTSButtonTwo(
                word: arabic,
                iconSize: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
