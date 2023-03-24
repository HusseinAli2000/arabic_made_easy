import 'dart:math';

import 'package:flutter/material.dart';

class FlipAnimation extends StatefulWidget {
  const FlipAnimation(
      {super.key,
      required this.word,
      required this.animate,
      required this.reverse,
      required this.animationDone,
      this.delay = 0});

  final Widget word;
  final bool animate;
  final bool reverse;
  final Function(bool) animationDone;
  final int delay;

  @override
  State<FlipAnimation> createState() => _FlipAnimationState();
}

class _FlipAnimationState extends State<FlipAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.animationDone.call(true);
        }
        if (status == AnimationStatus.dismissed) {
          widget.animationDone.call(false);
        }
      });

    _animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));
  }

  @override
  void didUpdateWidget(covariant FlipAnimation oldWidget) {
    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) {
        if (widget.animate) {
          if (widget.reverse) {
            _controller.reverse();
          } else {
            _controller.reset();
            _controller.forward();
          }
        }
      }
    });

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..rotateY(_animation.value * pi)
          ..setEntry(3, 2, 0.005),
        child: _controller.value >= 0.5
            ? widget.word
            : Container(
                padding: const EdgeInsets.all(20),
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
                child: const Icon(
                  Icons.question_mark,
                  size: 50,
                  color: Color.fromARGB(255, 235, 234, 243),
                ),
              ),
      ),
    );
  }
}
