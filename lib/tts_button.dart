import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'word.dart';

class TTSButton extends StatefulWidget {
  const TTSButton({super.key, required this.word, this.iconSize = 30});

  final Word word;
  final double iconSize;

  @override
  State<TTSButton> createState() => _TTSButtonState();
}

class _TTSButtonState extends State<TTSButton> {
  FlutterTts _tts = FlutterTts();

  @override
  void initState() {
    _setUpTts();
    super.initState();
  }

  @override
  void dispose() {
    _tts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        AudioPlayer().play(
          AssetSource('spelling/click.mp3'),
        );
        Future.delayed(
          const Duration(milliseconds: 500),
          () {
            _runTts(text: widget.word.arabic);
          },
        );
      },
      icon: Icon(
        Icons.volume_up,
        size: widget.iconSize,
        color: const Color.fromARGB(255, 235, 234, 243),
      ),
    );
  }

  _setUpTts() async {
    _tts.setLanguage('ar');
    await _tts.setSpeechRate(0.40);
  }

  _runTts({required String text}) async {
    await _tts.speak(text);
  }
}
