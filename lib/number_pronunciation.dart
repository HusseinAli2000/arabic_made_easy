import 'package:arabic_made_easy/numbers.dart';

import 'package:arabic_made_easy/tts_button_two.dart';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'second_page.dart';

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
                              builder: (context) => const Numbers(),
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
                crossAxisCount: 2,
                mainAxisSpacing: 25,
                crossAxisSpacing: 25,
                padding: const EdgeInsets.all(10),
                children: const [
                  gridTile(
                    arabic: '٠',
                    pronunciation: 'Sifr',
                    english: 'Zero',
                    TTSvalue: '0',
                    arabicWriting: 'صفر',
                  ),
                  gridTile(
                    arabic: '١',
                    pronunciation: 'Wahid',
                    english: 'One',
                    TTSvalue: '1',
                    arabicWriting: 'واحد',
                  ),
                  gridTile(
                    arabic: '٢',
                    pronunciation: 'Ithnan',
                    english: 'Two',
                    TTSvalue: '2',
                    arabicWriting: 'اثنان',
                  ),
                  gridTile(
                    arabic: '٣',
                    pronunciation: 'Thalatha',
                    english: 'Three',
                    TTSvalue: '3',
                    arabicWriting: 'ثلاثة',
                  ),
                  gridTile(
                    arabic: '٤',
                    pronunciation: 'Arbaa',
                    english: 'Four',
                    TTSvalue: '4',
                    arabicWriting: 'أربعة',
                  ),
                  gridTile(
                    arabic: '٥',
                    pronunciation: 'Khamsa',
                    english: 'Five',
                    TTSvalue: '5',
                    arabicWriting: 'خمسة',
                  ),
                  gridTile(
                    arabic: '٦',
                    pronunciation: 'Sitta',
                    english: 'Six',
                    TTSvalue: '6',
                    arabicWriting: 'ستة',
                  ),
                  gridTile(
                    arabic: '٧',
                    pronunciation: 'Sabaa',
                    english: 'Seven',
                    TTSvalue: '7',
                    arabicWriting: 'سبعة',
                  ),
                  gridTile(
                    arabic: '٨',
                    pronunciation: 'Thamania',
                    english: 'Eight',
                    TTSvalue: '8',
                    arabicWriting: 'ثمانية',
                  ),
                  gridTile(
                    arabic: '٩',
                    pronunciation: 'Tissaa',
                    english: 'Nine',
                    TTSvalue: '9',
                    arabicWriting: 'تسعة',
                  ),
                  gridTile(
                    arabic: '١٠',
                    pronunciation: 'Ashara',
                    english: 'Ten',
                    TTSvalue: '10',
                    arabicWriting: 'عشرة',
                  ),
                  gridTile(
                    arabic: '٢٠',
                    pronunciation: 'Ashrun',
                    english: 'Twenty',
                    TTSvalue: '20',
                    arabicWriting: 'عشرون',
                  ),
                  gridTile(
                    arabic: '٣٠',
                    pronunciation: 'Thalathun',
                    english: 'Thirty',
                    TTSvalue: '30',
                    arabicWriting: 'ثلاثون',
                  ),
                  gridTile(
                    arabic: '٤٠',
                    pronunciation: 'Arbaaun',
                    english: 'Fourty',
                    TTSvalue: '40',
                    arabicWriting: 'أربعون',
                  ),
                  gridTile(
                    arabic: '٥٠',
                    pronunciation: 'Khamsun',
                    english: 'Fifty',
                    TTSvalue: '50',
                    arabicWriting: 'خمسون',
                  ),
                  gridTile(
                    arabic: '٦٠',
                    pronunciation: 'Sittun',
                    english: 'Sixty',
                    TTSvalue: '60',
                    arabicWriting: 'ستون',
                  ),
                  gridTile(
                    arabic: '٧٠',
                    pronunciation: 'Sabun',
                    english: 'Seventy',
                    TTSvalue: '70',
                    arabicWriting: 'سبعون',
                  ),
                  gridTile(
                    arabic: '٨٠',
                    pronunciation: 'Thamanun',
                    english: 'Eighty',
                    TTSvalue: '80',
                    arabicWriting: 'ثمانون',
                  ),
                  gridTile(
                    arabic: '٩٠',
                    pronunciation: 'Tisun',
                    english: 'Ninety',
                    TTSvalue: '90',
                    arabicWriting: 'تسعون',
                  ),
                  gridTile(
                    arabic: '١٠٠',
                    pronunciation: 'Miaa',
                    english: 'A Hundred',
                    TTSvalue: '100',
                    arabicWriting: 'مئة',
                  ),
                  gridTile(
                    arabic: '١٠٠٠',
                    pronunciation: 'Alf',
                    english: 'A Thousand',
                    TTSvalue: '1000',
                    arabicWriting: 'ألف',
                  ),
                  gridTile(
                    arabic: '١٠٬٠٠٠',
                    pronunciation: 'Ashra Alaf',
                    english: 'Ten Thousand',
                    TTSvalue: '10000',
                    arabicWriting: 'عشرة ألاف',
                  ),
                  gridTile(
                    arabic: '١٠٠٬٠٠٠',
                    pronunciation: 'Miaa Alf',
                    english: 'A Hundred Thousand',
                    TTSvalue: '100,000',
                    arabicWriting: 'مئة ألف',
                  ),
                  gridTile(
                    arabic: '١٬٠٠٠٬٠٠٠',
                    pronunciation: 'Milyoon',
                    english: 'A Million',
                    TTSvalue: '1,000,000',
                    arabicWriting: 'مليون',
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
    required this.arabic,
    required this.pronunciation,
    required this.english,
    required this.TTSvalue,
    required this.arabicWriting,
  }) : super(key: key);

  final String arabic;
  final String arabicWriting;
  final String pronunciation;
  final String english;
  final String TTSvalue;

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            arabic,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color.fromARGB(255, 235, 234, 243),
              fontSize: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4),
            child: Text(
              arabicWriting,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color.fromARGB(255, 235, 234, 243),
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3),
            child: Text(
              english,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color.fromARGB(255, 235, 234, 243),
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3),
            child: Row(
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
                    fontSize: 16,
                    fontFamily: 'Akaya',
                  ),
                ),
                TTSButtonTwo(
                  word: TTSvalue,
                  iconSize: 25,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
