import 'package:arabic_made_easy/transport.dart';
import 'package:arabic_made_easy/tts_button_two.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'second_page.dart';

class TransportClass extends StatefulWidget {
  const TransportClass({super.key});

  @override
  State<TransportClass> createState() => _TransportClassState();
}

class _TransportClassState extends State<TransportClass> {
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
                  AudioPlayer().play(
                    AssetSource('spelling/click.mp3'),
                  );
                  Future.delayed(
                    const Duration(milliseconds: 500),
                    () {
                      setState(
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Transport(),
                            ),
                          );
                        },
                      );
                    },
                  );
                } else if (index == 1) {
                  AudioPlayer().play(
                    AssetSource('spelling/click.mp3'),
                  );
                  Future.delayed(
                    const Duration(milliseconds: 500),
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
              'Transport',
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
                      arabic: 'سيارة',
                      english: 'Car',
                      pronunciation: 'Sayyara'),
                  gridTiles(
                      arabic: 'حافلة', english: 'Bus', pronunciation: 'Hafila'),
                  gridTiles(
                      arabic: 'تكسي', english: 'Taxi', pronunciation: 'Taxi'),
                  gridTiles(
                      arabic: 'قطار', english: 'Train', pronunciation: 'Qitar'),
                  gridTiles(
                      arabic: 'طائرة',
                      english: 'Airplane',
                      pronunciation: 'Tayira'),
                  gridTiles(
                      arabic: 'دراجة نارية',
                      english: 'Motorcycle',
                      pronunciation: 'Daraja Nariya'),
                  gridTiles(
                      arabic: 'دراجة',
                      english: 'Bicycle',
                      pronunciation: 'Daraja'),
                  gridTiles(
                      arabic: 'سفينة',
                      english: 'Ship',
                      pronunciation: 'Safina'),
                  gridTiles(
                      arabic: 'قارب', english: 'Boat', pronunciation: 'Qarib'),
                  gridTiles(
                      arabic: 'شاحنة',
                      english: 'Truck',
                      pronunciation: 'Shahina'),
                  gridTiles(
                      arabic: 'مطار',
                      english: 'Airport',
                      pronunciation: 'Matar'),
                  gridTiles(
                      arabic: 'ميناء', english: 'Port', pronunciation: 'Minaa'),
                  gridTiles(
                      arabic: 'طريق', english: 'Road', pronunciation: 'Tariq'),
                  gridTiles(
                      arabic: 'جسر', english: 'Bridge', pronunciation: 'Jisr'),
                  gridTiles(
                      arabic: 'تقاطع',
                      english: 'Intersection',
                      pronunciation: 'Taqatuu'),
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
                width: 15,
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
