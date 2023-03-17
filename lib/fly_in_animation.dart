import 'package:flutter/material.dart';

class FlyInAnimation extends StatefulWidget {
  const FlyInAnimation({super.key, required this.child, required this.animate});

  final Widget child;
  final bool animate;

  @override
  State<FlyInAnimation> createState() => _FlyInAnimationState();
}

class _FlyInAnimationState extends State<FlyInAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    super.initState();
  }

  @override
  void didUpdateWidget(covariant FlyInAnimation oldWidget) {
    if (widget.animate && !_controller.isAnimating) {
      _controller.reset();
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
      builder: (context, child) => RotationTransition(
        turns: _controller,
        child: ScaleTransition(
          scale: _controller,
          child: widget.child,
        ),
      ),
    );
  }
}
