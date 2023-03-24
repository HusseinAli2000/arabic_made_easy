import 'package:arabic_made_easy/shapes.dart';
import 'package:arabic_made_easy/tts_button_two.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'second_page.dart';

class ShapesClass extends StatefulWidget {
  const ShapesClass({super.key});

  @override
  State<ShapesClass> createState() => _ShapesClassState();
}

class _ShapesClassState extends State<ShapesClass> {
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
                              builder: (context) => const Shapes(),
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
              'Shapes',
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
                      arabic: 'دائرة',
                      english: 'Circle',
                      pronunciation: 'Dayira'),
                  gridTiles(
                      arabic: 'مثلث',
                      english: 'Triangle',
                      pronunciation: 'Muthalath'),
                  gridTiles(
                      arabic: 'مربع',
                      english: 'Square',
                      pronunciation: 'Murabaa'),
                  gridTiles(
                      arabic: 'مستطيل',
                      english: 'Rectangle',
                      pronunciation: 'Mustatil'),
                  gridTiles(
                      arabic: 'خماسي الاضلاع',
                      english: 'Pentagon',
                      pronunciation: 'Khumasi Aladhla'),
                  gridTiles(
                      arabic: 'سداسي الاضلاع',
                      english: 'Hexagon',
                      pronunciation: 'Sudasi Aladhla'),
                  gridTiles(
                      arabic: 'سباعي',
                      english: 'Heptagon',
                      pronunciation: 'Subaei'),
                  gridTiles(
                      arabic: 'مثمن',
                      english: 'Octagon',
                      pronunciation: 'Muthaman'),
                  gridTiles(
                      arabic: 'شبه منحرف',
                      english: 'Trapezoid',
                      pronunciation: 'Shibh Munharif'),
                  gridTiles(
                      arabic: 'معين',
                      english: 'Rhombus',
                      pronunciation: 'Mueayan'),
                  gridTiles(
                      arabic: 'متوازي الاضلاع',
                      english: 'Parallelogram',
                      pronunciation: 'Mutwazi Aladhla'),
                  gridTiles(
                      arabic: 'بيضاوي',
                      english: 'Oval',
                      pronunciation: 'Baydhawi'),
                  gridTiles(
                      arabic: 'مكور',
                      english: 'Sphere',
                      pronunciation: 'Mukawar'),
                  gridTiles(
                      arabic: 'مكعب', english: 'Cube', pronunciation: 'Mukaeb'),
                  gridTiles(
                      arabic: 'مكعباني',
                      english: 'Cuboid',
                      pronunciation: 'Mukabaniun'),
                  gridTiles(
                      arabic: 'اسطوانة',
                      english: 'Cylinder',
                      pronunciation: 'Makhroot'),
                  gridTiles(
                      arabic: 'مخروط',
                      english: 'Cone',
                      pronunciation: 'Baydhawi'),
                  gridTiles(
                      arabic: 'هرم', english: 'Pyramid', pronunciation: 'Harm'),
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
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(
              'images/${english.toLowerCase()}.png',
              height: 45,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
              arabic,
              style: const TextStyle(
                color: Color.fromARGB(255, 235, 234, 243),
                fontFamily: 'Akaya',
                fontSize: 16,
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
                fontSize: 16,
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
                  fontSize: 16,
                ),
              ),
              TTSButtonTwo(
                word: arabic,
                iconSize: 25,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
