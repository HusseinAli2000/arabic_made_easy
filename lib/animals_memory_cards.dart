import 'package:arabic_made_easy/main.dart';
import 'package:arabic_made_easy/second_page.dart';
import 'package:arabic_made_easy/word_memory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class AnimalsMemoryCards extends StatefulWidget {
  const AnimalsMemoryCards({super.key});

  @override
  State<AnimalsMemoryCards> createState() => _AnimalsMemoryCardsState();
}

class _AnimalsMemoryCardsState extends State<AnimalsMemoryCards> {
  List<WordMemory> _gridWords = [];

  @override
  void initState() {
    _setUp();
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final widthPadding = size.width * 0.10;
    final heightPadding = size.height * 0.02;

    return FutureBuilder(
      future: _cacheImages(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          Center(
            child: Text(
              'Error, Check Your Connection',
              textAlign: TextAlign.center,
            ),
          );
        }
        if (snapshot.hasData) {
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 9, vertical: 9),
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
                                Navigator.maybePop(context);
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
                    'Animals Memory Cards',
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
                    child: GridView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.fromLTRB(widthPadding,
                            heightPadding, widthPadding, heightPadding),
                        itemCount: 6,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            mainAxisExtent: size.height * 0.27),
                        itemBuilder: (context, index) => WordTile(
                              index: index,
                              word: _gridWords[index],
                            )),
                  ),
                ),
              ),
            ),
          );
        } else {
          return Center(
              child:
                  CircularProgressIndicator()); // display main content when data is ready
        }
      },
    );
  }

  _setUp() {
    sourceWords.shuffle();
    for (int i = 0; i < 3; i++) {
      _gridWords.add(sourceWords[i]);
      _gridWords.add(WordMemory(
          displayText: true,
          text: sourceWords[i].text,
          url: sourceWords[i].url));
    }
    _gridWords.shuffle();
  }

  Future<int> _cacheImages() async {
    for (var w in _gridWords) {
      final image = Image.network(w.url);
      await precacheImage(image.image, context);
    }
    return 1;
  }
}

class WordTile extends StatelessWidget {
  const WordTile({
    Key? key,
    required this.index,
    required this.word,
  }) : super(key: key);

  final int index;
  final WordMemory word;

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
        child: word.displayText ? Text(word.text) : Image.network(word.url));
  }
}
