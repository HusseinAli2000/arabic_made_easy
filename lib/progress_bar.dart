import 'package:arabic_made_easy/flashcards_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({super.key});

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double beginValue = 0.0;
  double endValue = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<FlashCardNotifier, double>(
      selector: (_, notifier) => notifier.percentComplete,
      builder: (_, percentComplete, __) {
        endValue = percentComplete;
        if (endValue == 0) {
          beginValue = 0;
        }
        var animation = Tween<double>(begin: beginValue, end: endValue).animate(
          CurvedAnimation(parent: _controller, curve: Curves.elasticInOut),
        );
        _controller.reset();
        _controller.forward();
        beginValue = endValue;

        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => Padding(
            padding: const EdgeInsets.fromLTRB(27, 0, 27, 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: LinearProgressIndicator(
                minHeight: 20,
                value: animation.value,
                color: const Color.fromARGB(255, 35, 61, 155),
                backgroundColor: const Color.fromARGB(255, 235, 234, 243),
              ),
            ),
          ),
        );
      },
    );
  }
}
