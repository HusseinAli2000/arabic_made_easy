import 'package:arabic_made_easy/cuw.dart';
import 'package:arabic_made_easy/tts_button_two.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'second_page.dart';

class CommonlyUsedWordsClass extends StatefulWidget {
  const CommonlyUsedWordsClass({super.key});

  @override
  State<CommonlyUsedWordsClass> createState() => _CommonlyUsedWordsClassState();
}

class _CommonlyUsedWordsClassState extends State<CommonlyUsedWordsClass> {
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
                              builder: (context) => const CommonlyUsedWords(),
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
              'Commonly Used Words',
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
                      arabic: 'ماء', english: 'Water', pronunciation: 'Maa'),
                  gridTiles(
                      arabic: 'طعام', english: 'Food', pronunciation: 'Taam'),
                  gridTiles(
                      arabic: 'بيت', english: 'House', pronunciation: 'Bayt'),
                  gridTiles(
                      arabic: 'شمس', english: 'Sun', pronunciation: 'Shams'),
                  gridTiles(
                      arabic: 'قمر', english: 'Moon', pronunciation: 'Qamar'),
                  gridTiles(
                      arabic: 'مدينة',
                      english: 'City',
                      pronunciation: 'Madina'),
                  gridTiles(
                      arabic: 'بلد',
                      english: 'Country',
                      pronunciation: 'Balad'),
                  gridTiles(
                      arabic: 'أم', english: 'Mother', pronunciation: 'Umm'),
                  gridTiles(
                      arabic: 'أب', english: 'Father', pronunciation: 'Ab'),
                  gridTiles(
                      arabic: 'أخوان',
                      english: 'Brothers',
                      pronunciation: 'Akhwan'),
                  gridTiles(
                      arabic: 'أخوات',
                      english: 'Sisters',
                      pronunciation: 'Akhwat'),
                  gridTiles(
                      arabic: 'أصدقاء',
                      english: 'Friends',
                      pronunciation: 'Assdeqaa'),
                  gridTiles(
                      arabic: 'عمل', english: 'Work', pronunciation: 'Amal'),
                  gridTiles(
                      arabic: 'مدرسة',
                      english: 'School',
                      pronunciation: 'Madrasa'),
                  gridTiles(
                      arabic: 'جامعة',
                      english: 'University',
                      pronunciation: 'Jamiaa'),
                  gridTiles(
                      arabic: 'طبيب',
                      english: 'Doctor',
                      pronunciation: 'Tabeeb'),
                  gridTiles(
                      arabic: 'مستشفى',
                      english: 'Hospital',
                      pronunciation: 'Mustashfa'),
                  gridTiles(
                      arabic: 'شارع',
                      english: 'Street',
                      pronunciation: 'Sharii'),
                  gridTiles(
                      arabic: 'سوق', english: 'Market', pronunciation: 'Souq'),
                  gridTiles(
                      arabic: 'كتاب', english: 'Book', pronunciation: 'Kitab'),
                  gridTiles(
                      arabic: 'قلم', english: 'Pen', pronunciation: 'Qalam'),
                  gridTiles(
                      arabic: 'هاتف',
                      english: 'Telephone',
                      pronunciation: 'Hatif'),
                  gridTiles(
                      arabic: 'باب', english: 'Door', pronunciation: 'Bab'),
                  gridTiles(
                      arabic: 'نافذة',
                      english: 'Window',
                      pronunciation: 'Nafidha'),
                  gridTiles(
                      arabic: 'طاولة',
                      english: 'Table',
                      pronunciation: 'Tawila'),
                  gridTiles(
                      arabic: 'كرسي', english: 'Chair', pronunciation: 'Kursi'),
                  gridTiles(
                      arabic: 'سرير', english: 'Bed', pronunciation: 'Sareer'),
                  gridTiles(
                      arabic: 'شاي', english: 'Tea', pronunciation: 'Shai'),
                  gridTiles(
                      arabic: 'قهوة',
                      english: 'Coffee',
                      pronunciation: 'Qahwa'),
                  gridTiles(
                      arabic: 'حمام',
                      english: 'Bathroom',
                      pronunciation: 'Hamam'),
                  gridTiles(
                      arabic: 'مطبخ',
                      english: 'Kitchen',
                      pronunciation: 'Matbakh'),
                  gridTiles(
                      arabic: 'سفر', english: 'Travel', pronunciation: 'Safar'),
                  gridTiles(
                      arabic: 'بحر', english: 'Sea', pronunciation: 'Bahar'),
                  gridTiles(
                      arabic: 'جبل',
                      english: 'Mountain',
                      pronunciation: 'Jabal'),
                  gridTiles(
                      arabic: 'ذهب', english: 'Gold', pronunciation: 'Dhahab'),
                  gridTiles(
                      arabic: 'فضة', english: 'Silver', pronunciation: 'Fidda'),
                  gridTiles(
                      arabic: 'دواء',
                      english: 'Medicine',
                      pronunciation: 'Dawaa'),
                  gridTiles(
                      arabic: 'حُب', english: 'Love', pronunciation: 'Hubb'),
                  gridTiles(
                      arabic: 'حرب', english: 'War', pronunciation: 'Harb'),
                  gridTiles(
                      arabic: 'عملة',
                      english: 'Currency',
                      pronunciation: 'Umla'),
                  gridTiles(
                      arabic: 'مصرف', english: 'Bank', pronunciation: 'Masraf'),
                  gridTiles(
                      arabic: 'دفع',
                      english: 'Payment',
                      pronunciation: 'Dafaa'),
                  gridTiles(
                      arabic: 'مستقبل',
                      english: 'Future',
                      pronunciation: 'Mustaqbal'),
                  gridTiles(
                      arabic: 'قانون', english: 'Law', pronunciation: 'Qanun'),
                  gridTiles(
                      arabic: 'سرقة',
                      english: 'Theft',
                      pronunciation: 'Sariqa'),
                  gridTiles(
                      arabic: 'أمن',
                      english: 'Security',
                      pronunciation: 'Aman'),
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
