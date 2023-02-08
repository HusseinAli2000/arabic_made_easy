import 'package:arabic_made_easy/colors.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'alphabet_page.dart';
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
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                padding: const EdgeInsets.all(10),
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      color: Colors.black,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text(
                              'أسود',
                              style: TextStyle(
                                color: Color.fromARGB(255, 235, 234, 243),
                                fontFamily: 'Akaya',
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text(
                              'Black',
                              style: TextStyle(
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
                              const Text(
                                'Aswad',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 235, 234, 243),
                                  fontFamily: 'Akaya',
                                  fontSize: 16,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.volume_up_rounded,
                                  color: Color.fromARGB(255, 235, 234, 243),
                                ),
                                onPressed: () {},
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
                      color: Colors.white,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text(
                              'أبيض',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Akaya',
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text(
                              'White',
                              style: TextStyle(
                                color: Colors.black,
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
                              const Text(
                                'Abyad',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Akaya',
                                  fontSize: 16,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.volume_up_rounded,
                                    color: Colors.black),
                                onPressed: () {},
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
                      color: Colors.red,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text(
                              'أحمر',
                              style: TextStyle(
                                color: Color.fromARGB(255, 235, 234, 243),
                                fontFamily: 'Akaya',
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text(
                              'Red',
                              style: TextStyle(
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
                              const Text(
                                'Ahmar',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 235, 234, 243),
                                  fontFamily: 'Akaya',
                                  fontSize: 16,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.volume_up_rounded,
                                  color: Color.fromARGB(255, 235, 234, 243),
                                ),
                                onPressed: () {},
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
                      color: Colors.blue,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text(
                              'أزرق',
                              style: TextStyle(
                                color: Color.fromARGB(255, 235, 234, 243),
                                fontFamily: 'Akaya',
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text(
                              'Blue',
                              style: TextStyle(
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
                              const Text(
                                'Azraq',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 235, 234, 243),
                                  fontFamily: 'Akaya',
                                  fontSize: 16,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.volume_up_rounded,
                                  color: Color.fromARGB(255, 235, 234, 243),
                                ),
                                onPressed: () {},
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
                      color: Colors.green,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text(
                              'أخضر',
                              style: TextStyle(
                                color: Color.fromARGB(255, 235, 234, 243),
                                fontFamily: 'Akaya',
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text(
                              'Green',
                              style: TextStyle(
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
                              const Text(
                                'Akhdar',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 235, 234, 243),
                                  fontFamily: 'Akaya',
                                  fontSize: 16,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.volume_up_rounded,
                                  color: Color.fromARGB(255, 235, 234, 243),
                                ),
                                onPressed: () {},
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
                      color: Colors.orange,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text(
                              'برتقالي',
                              style: TextStyle(
                                color: Color.fromARGB(255, 235, 234, 243),
                                fontFamily: 'Akaya',
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text(
                              'Orange',
                              style: TextStyle(
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
                              const Text(
                                'Burtuqali',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 235, 234, 243),
                                  fontFamily: 'Akaya',
                                  fontSize: 14,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.volume_up_rounded,
                                  color: Color.fromARGB(255, 235, 234, 243),
                                ),
                                onPressed: () {},
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
                      color: Colors.pink,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text(
                              'بمبي',
                              style: TextStyle(
                                color: Color.fromARGB(255, 235, 234, 243),
                                fontFamily: 'Akaya',
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text(
                              'Pink',
                              style: TextStyle(
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
                              const Text(
                                'Bambi',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 235, 234, 243),
                                  fontFamily: 'Akaya',
                                  fontSize: 16,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.volume_up_rounded,
                                  color: Color.fromARGB(255, 235, 234, 243),
                                ),
                                onPressed: () {},
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
                      color: Colors.purple,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text(
                              'بنفسجي',
                              style: TextStyle(
                                color: Color.fromARGB(255, 235, 234, 243),
                                fontFamily: 'Akaya',
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text(
                              'Purple',
                              style: TextStyle(
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
                              const Text(
                                'Banafsaji',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 235, 234, 243),
                                  fontFamily: 'Akaya',
                                  fontSize: 13,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.volume_up_rounded,
                                  color: Color.fromARGB(255, 235, 234, 243),
                                ),
                                onPressed: () {},
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
                      color: Colors.yellow,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text(
                              'أصفر',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Akaya',
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text(
                              'Yellow',
                              style: TextStyle(
                                color: Colors.black,
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
                              const Text(
                                'Asfar',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Akaya',
                                  fontSize: 16,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.volume_up_rounded,
                                  color: Colors.black,
                                ),
                                onPressed: () {},
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
                      color: Colors.brown,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text(
                              'بني',
                              style: TextStyle(
                                color: Color.fromARGB(255, 235, 234, 243),
                                fontFamily: 'Akaya',
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text(
                              'Brown',
                              style: TextStyle(
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
                              const Text(
                                'Bunni',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 235, 234, 243),
                                  fontFamily: 'Akaya',
                                  fontSize: 16,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.volume_up_rounded,
                                  color: Color.fromARGB(255, 235, 234, 243),
                                ),
                                onPressed: () {},
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
                      color: Colors.grey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text(
                              'رمادي',
                              style: TextStyle(
                                color: Color.fromARGB(255, 235, 234, 243),
                                fontFamily: 'Akaya',
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text(
                              'Grey',
                              style: TextStyle(
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
                              const Text(
                                'Ramadi',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 235, 234, 243),
                                  fontFamily: 'Akaya',
                                  fontSize: 16,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.volume_up_rounded,
                                  color: Color.fromARGB(255, 235, 234, 243),
                                ),
                                onPressed: () {},
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
                      color: Colors.amber,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text(
                              'عنبر',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Akaya',
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text(
                              'Amber',
                              style: TextStyle(
                                color: Colors.black,
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
                              const Text(
                                'Anbar',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Akaya',
                                  fontSize: 16,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.volume_up_rounded,
                                  color: Colors.black,
                                ),
                                onPressed: () {},
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
