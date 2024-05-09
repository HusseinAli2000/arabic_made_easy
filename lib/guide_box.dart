import 'package:arabic_made_easy/fade_in_animation.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class GuideBox extends StatelessWidget {
  const GuideBox({super.key, required this.isFirst});

  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    return FadeInAnimation(
      child: AlertDialog(
        contentPadding: const EdgeInsets.all(0),
        insetPadding: const EdgeInsets.fromLTRB(90, 170, 90, 190),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Container(
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
              if (isFirst) ...[
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    'Double Tap\nTo Reveal Answer',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Akaya',
                      fontSize: 18,
                      color: Color.fromARGB(255, 235, 234, 243),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Image.asset('images/GuideDoubleTap.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.only(left: 50, right: 50),
                          backgroundColor:
                              const Color.fromARGB(130, 35, 61, 155),
                          textStyle: const TextStyle(
                            color: Color.fromARGB(255, 235, 234, 243),
                            fontFamily: 'Akaya',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          AudioPlayer().play(
                            AssetSource('spelling/click.mp3'),
                          );
                          Future.delayed(
                            const Duration(milliseconds: 500),
                            () {
                              Navigator.maybePop(context);
                            },
                          );
                        },
                        child: const Text('Got It!'),
                      ),
                    ],
                  ),
                ),
              ] else ...[
                Column(
                  children: [
                    SizedBox(
                      height: 300,
                      width: 500,
                      child: Row(
                        children: const [
                          GuideSwipe(
                            isLeft: true,
                          ),
                          GuideSwipe(
                            isLeft: false,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.only(left: 50, right: 50),
                            backgroundColor:
                                const Color.fromARGB(130, 35, 61, 155),
                            textStyle: const TextStyle(
                              color: Color.fromARGB(255, 235, 234, 243),
                              fontFamily: 'Akaya',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            AudioPlayer().play(
                              AssetSource('spelling/click.mp3'),
                            );
                            Future.delayed(
                              const Duration(milliseconds: 500),
                              () {
                                Navigator.maybePop(context);
                              },
                            );
                          },
                          child: const Text('Got It!'),
                        ),
                      ],
                    ),
                  ],
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class GuideSwipe extends StatelessWidget {
  const GuideSwipe({
    required this.isLeft,
    Key? key,
  }) : super(key: key);

  final bool isLeft;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        isLeft
            ? const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Swipe Left\nIf Incorrect',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Akaya',
                    fontSize: 15,
                    color: Color.fromARGB(255, 235, 234, 243),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Swipe Right\nIf Correct',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Akaya',
                    fontSize: 15,
                    color: Color.fromARGB(255, 235, 234, 243),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
        Expanded(
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: isLeft
                  ? Image.asset('images/GuideLeftSwipe.png')
                  : Image.asset('images/GuideRightSwipe.png')),
        ),
      ],
    ));
  }
}
