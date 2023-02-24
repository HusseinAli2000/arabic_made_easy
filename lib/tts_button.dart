import 'package:arabic_made_easy/flashcards_notifier.dart';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';

class TTSButton extends StatefulWidget {
  const TTSButton({super.key});

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
    return Consumer<FlashCardNotifier>(
      builder: (_, notifier, __) => IconButton(
        onPressed: () {
          _runTts(text: notifier.word1.arabic);
        },
        icon: const Icon(
          Icons.volume_up,
          size: 30,
          color: Color.fromARGB(255, 235, 234, 243),
        ),
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
