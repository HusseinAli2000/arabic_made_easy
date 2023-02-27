import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'animals.dart';
import 'second_page.dart';
import 'word.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final _listKey = GlobalKey<AnimatedListState>();
  final _reviewWords = [];

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
                              builder: (context) => const Animals(),
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
              'Quiz Review',
              style: TextStyle(
                fontFamily: 'Akaya',
                fontSize: 25,
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
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        HeaderButton(
                          title: 'Insert Cards',
                          onPressed: () {
                            var initialWords = [
                              Word(
                                  topic: "Animals",
                                  arabic: "جمل",
                                  english: "Camel",
                                  pronunciation: "Jaml"),
                              Word(
                                  topic: "Animals",
                                  arabic: "قطة",
                                  english: "Cat",
                                  pronunciation: "Qita"),
                              Word(
                                  topic: "Animals",
                                  arabic: "دجاجة",
                                  english: "Chicken",
                                  pronunciation: "Dajaja"),
                              Word(
                                  topic: "Animals",
                                  arabic: "صرصور",
                                  english: "Cockroach",
                                  pronunciation: "Sarsur"),
                            ];
                            _insertWords(word: initialWords);
                          },
                        ),
                        HeaderButton(
                          title: 'Clear Cards',
                          onPressed: () {
                            _clearAllWords();
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: AnimatedList(
                      key: _listKey,
                      initialItemCount: _reviewWords.length,
                      itemBuilder: ((context, index, animation) => WordTile(
                            index: index,
                            word: _reviewWords[index],
                            animation: animation,
                            onPressed: () {
                              _removeWord(word: _reviewWords[index]);
                            },
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _insertWords({required List<Word> word}) {
    for (int i = 0; i < word.length; i++) {
      _listKey.currentState?.insertItem(i);
      _reviewWords.insert(i, word[i]);
    }
  }

  _removeWord({required Word word}) {
    var w = word;
    _listKey.currentState?.removeItem(
        _reviewWords.indexOf(w),
        (context, animation) => WordTile(
              word: word,
              animation: animation,
              index: _reviewWords.indexOf(w),
            ));
    _reviewWords.remove(w);
  }

  _clearAllWords() {
    for (int i = 0; i < _reviewWords.length; i++) {
      _listKey.currentState?.removeItem(
        0,
        (context, animation) => WordTile(
          word: _reviewWords[i],
          animation: animation,
          index: i,
        ),
      );
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _reviewWords.clear();
    });
  }
}

class WordTile extends StatelessWidget {
  WordTile({
    Key? key,
    required this.word,
    required this.animation,
    this.onPressed,
    required this.index,
  }) : super(key: key);

  final Word word;

  final Animation animation;
  final _tweenOffsetLeft =
      Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0));
  final _tweenOffsetRight =
      Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0));
  final VoidCallback? onPressed;
  final int index;
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation
          .drive(CurveTween(curve: Curves.easeInOutSine))
          .drive(index % 2 == 0 ? _tweenOffsetRight : _tweenOffsetLeft),
      child: Column(
        children: [
          ListTile(
            style: ListTileStyle.drawer,
            trailing: IconButton(
              icon: const Icon(
                Icons.clear,
                color: Color.fromARGB(255, 235, 234, 243),
              ),
              onPressed: () {
                onPressed?.call();
              },
            ),
            title: Text(
              word.english,
              style: const TextStyle(
                color: Color.fromARGB(255, 235, 234, 243),
                fontFamily: 'Akaya',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
            color: Color.fromARGB(78, 0, 17, 115),
          )
        ],
      ),
    );
  }
}

class HeaderButton extends StatelessWidget {
  const HeaderButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(130, 35, 61, 155),
          textStyle: const TextStyle(
            color: Color.fromARGB(255, 235, 234, 243),
            fontFamily: 'Akaya',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: onPressed,
        child: Text(title),
      ),
    ));
  }
}
