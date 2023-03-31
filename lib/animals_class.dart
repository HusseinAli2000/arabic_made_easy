import 'package:arabic_made_easy/tts_button_two.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'animals.dart';
import 'second_page.dart';

class AnimalsClass extends StatefulWidget {
  const AnimalsClass({super.key});

  @override
  State<AnimalsClass> createState() => _AnimalsClassState();
}

class _AnimalsClassState extends State<AnimalsClass> {
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
                              builder: (context) => const Animals(),
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
              'Animals',
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
                      arabic: 'تمساح',
                      english: 'Alligator',
                      pronunciation: 'Timsah'),
                  gridTile(
                      arabic: 'نملة', english: 'Ant', pronunciation: 'Namla'),
                  gridTile(
                      arabic: 'خفاش', english: 'Bat', pronunciation: 'Khafash'),
                  gridTile(
                      arabic: 'دُب', english: 'Bear', pronunciation: 'Doob'),
                  gridTile(
                      arabic: 'نحلة', english: 'Bee', pronunciation: 'Nahla'),
                  gridTile(
                      arabic: 'طائر', english: 'Bird', pronunciation: 'Tayir'),
                  gridTile(
                      arabic: 'فراشة',
                      english: 'Butterfly',
                      pronunciation: 'Farasha'),
                  gridTile(
                      arabic: 'جمل', english: 'Camel', pronunciation: 'Jamel'),
                  gridTile(
                      arabic: 'قطة', english: 'Cat', pronunciation: 'Qita'),
                  gridTile(
                      arabic: 'دجاجة',
                      english: 'Chicken',
                      pronunciation: 'Dajaja'),
                  gridTile(
                      arabic: 'صرصور',
                      english: 'Cockroach',
                      pronunciation: 'Sarsur'),
                  gridTile(
                      arabic: 'بقرة', english: 'Cow', pronunciation: 'Baqara'),
                  gridTile(
                      arabic: 'غزالة',
                      english: 'Deer',
                      pronunciation: 'Ghazala'),
                  gridTile(
                      arabic: 'كلب', english: 'Dog', pronunciation: 'Kalb'),
                  gridTile(
                      arabic: 'دولفين',
                      english: 'Dolphin',
                      pronunciation: 'Dulfeen'),
                  gridTile(
                      arabic: 'حمار',
                      english: 'Donkey',
                      pronunciation: 'Himar'),
                  gridTile(
                      arabic: 'بطة', english: 'Duck', pronunciation: 'Bata'),
                  gridTile(
                      arabic: 'نسر', english: 'Eagle', pronunciation: 'Nasr'),
                  gridTile(
                      arabic: 'فيل',
                      english: 'Elephant',
                      pronunciation: 'Fiil'),
                  gridTile(
                      arabic: 'سمكة', english: 'Fish', pronunciation: 'Samaka'),
                  gridTile(
                      arabic: 'ثعلب', english: 'Fox', pronunciation: 'Thalab'),
                  gridTile(
                      arabic: 'ضفدع', english: 'Frog', pronunciation: 'Dhafda'),
                  gridTile(
                      arabic: 'زرافة',
                      english: 'Giraffe',
                      pronunciation: 'Zarafa'),
                  gridTile(
                      arabic: 'معزة', english: 'Goat', pronunciation: 'Maeza'),
                  gridTile(
                      arabic: 'غورلا',
                      english: 'Gorilla',
                      pronunciation: 'Ghurila'),
                  gridTile(
                      arabic: 'فرس النهر',
                      english: 'Hippopotamus',
                      pronunciation: 'Farass Alnahar'),
                  gridTile(
                      arabic: 'حصان', english: 'Horse', pronunciation: 'Hisan'),
                  gridTile(
                      arabic: 'كنغر',
                      english: 'Kangaroo',
                      pronunciation: 'Kanghar'),
                  gridTile(
                      arabic: 'أسد', english: 'Lion', pronunciation: 'Asad'),
                  gridTile(
                      arabic: 'سحلية',
                      english: 'Lizard',
                      pronunciation: 'Sahlia'),
                  gridTile(
                      arabic: 'سرطان البحر',
                      english: 'Lobster',
                      pronunciation: 'Saratan Albahar'),
                  gridTile(
                      arabic: 'قرد', english: 'Monkey', pronunciation: 'Qird'),
                  gridTile(
                      arabic: 'فأرة', english: 'Mouse', pronunciation: 'Fara'),
                  gridTile(
                      arabic: 'أخطبوط',
                      english: 'Octopus',
                      pronunciation: 'Akhtabut'),
                  gridTile(
                      arabic: 'نعامة',
                      english: 'Ostrich',
                      pronunciation: 'Naama'),
                  gridTile(
                      arabic: 'بومة', english: 'Owl', pronunciation: 'Buma'),
                  gridTile(
                      arabic: 'باندا',
                      english: 'Panda',
                      pronunciation: 'Banda'),
                  gridTile(
                      arabic: 'ببغاء',
                      english: 'Parrot',
                      pronunciation: 'Babaghaa'),
                  gridTile(
                      arabic: 'بطريق',
                      english: 'Penguin',
                      pronunciation: 'Batreeq'),
                  gridTile(
                      arabic: 'خنزير',
                      english: 'Pig',
                      pronunciation: 'Khanzeer'),
                  gridTile(
                      arabic: 'أرنب',
                      english: 'Rabbit',
                      pronunciation: 'Arnab'),
                  gridTile(
                      arabic: 'راكون',
                      english: 'Raccoon',
                      pronunciation: 'Raakoon'),
                  gridTile(
                      arabic: 'سمك القرش',
                      english: 'Shark',
                      pronunciation: 'Samak Alqirsh'),
                  gridTile(
                      arabic: 'غنم', english: 'Sheep', pronunciation: 'Ghanam'),
                  gridTile(
                      arabic: 'ثعبان',
                      english: 'Snake',
                      pronunciation: 'Thueban'),
                  gridTile(
                      arabic: 'عنكبوت',
                      english: 'Spider',
                      pronunciation: 'Ankabut'),
                  gridTile(
                      arabic: 'سنجاب',
                      english: 'Squirrel',
                      pronunciation: 'Sinjab'),
                  gridTile(
                      arabic: 'نمر', english: 'Tiger', pronunciation: 'Nimr'),
                  gridTile(
                      arabic: 'سلحفاة',
                      english: 'Turtle',
                      pronunciation: 'Sulhafaa'),
                  gridTile(
                      arabic: 'حوت', english: 'Whale', pronunciation: 'Hoot'),
                  gridTile(
                      arabic: 'ذئب', english: 'Wolf', pronunciation: 'Dhib'),
                  gridTile(
                      arabic: 'دودة', english: 'Worm', pronunciation: 'Duda'),
                  gridTile(
                      arabic: 'حمار وحشي',
                      english: 'Zebra',
                      pronunciation: 'Himar Wahshi'),
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
            padding: const EdgeInsets.all(5.0),
            child: Image.asset(
              'images/${english.toLowerCase()}.png',
              height: 40,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
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
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
