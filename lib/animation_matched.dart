import 'package:flutter/material.dart';

class AnimationMatched extends StatefulWidget {
  const AnimationMatched(
      {super.key,
      required this.child,
      required this.animate,
      required this.numberWordsAnswered});

  final Widget child;
  final bool animate;
  final int numberWordsAnswered;

  @override
  State<AnimationMatched> createState() => _AnimationMatchedState();
}

class _AnimationMatchedState extends State<AnimationMatched>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _shake;
  late Animation<double> _scale;
  Color _defaultColor = const Color.fromARGB(255, 62, 62, 62);
  Color _correctColor = const Color.fromARGB(255, 17, 47, 153);
  bool _correctColorSet = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));

    _shake = TweenSequence<double>([
      TweenSequenceItem(tween: Tween<double>(begin: 0, end: 0.1), weight: 4),
      TweenSequenceItem(
          tween: Tween<double>(begin: 0.1, end: -0.06), weight: 6),
      TweenSequenceItem(
          tween: Tween<double>(begin: -0.06, end: 0.03), weight: 6),
      TweenSequenceItem(tween: Tween<double>(begin: 0.03, end: 0), weight: 7),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _scale = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 1, end: 0.9), weight: 8),
      TweenSequenceItem(tween: Tween<double>(begin: 0.9, end: 1), weight: 4),
    ]).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void didUpdateWidget(covariant AnimationMatched oldWidget) {
    if (widget.animate) {
      if (!_correctColorSet) {
        if (widget.numberWordsAnswered == 4) {
          _correctColor = const Color.fromARGB(255, 13, 32, 100);
        }
        if (widget.numberWordsAnswered == 6) {
          _correctColor = const Color.fromARGB(255, 5, 21, 79);
        }
      }
      _correctColorSet = true;
      _controller.forward();
    }
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
          ..rotateZ(_shake.value)
          ..scale(_scale.value)
          ..setEntry(3, 2, 0.005),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: widget.animate ? _correctColor : _defaultColor,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
