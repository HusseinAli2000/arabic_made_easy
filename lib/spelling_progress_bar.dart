import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'spelling_controller.dart';

class SpellingProgressBar extends StatefulWidget {
  const SpellingProgressBar({super.key});

  @override
  State<SpellingProgressBar> createState() => _SpellingProgressBarState();
}

class _SpellingProgressBarState extends State<SpellingProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double begin = 0;
  double end = 0;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    _animation = Tween<double>(begin: begin, end: end).animate(
        CurvedAnimation(parent: _controller, curve: Curves.elasticInOut));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<Controller, double>(
      selector: (_, controller) => controller.percentCompleted,
      builder: (_, percent, __) {
        end = percent;
        if (!_controller.isAnimating) {
          _animation = Tween<double>(begin: begin, end: end).animate(
              CurvedAnimation(parent: _controller, curve: Curves.elasticInOut));
          _controller.reset();
          _controller.forward();
          begin = end;
          if (begin == 1) {
            begin = 0;
            end = 0;
          }
        }
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => Padding(
            padding: const EdgeInsets.fromLTRB(27, 0, 27, 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: LinearProgressIndicator(
                value: _animation.value,
                minHeight: 20,
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
