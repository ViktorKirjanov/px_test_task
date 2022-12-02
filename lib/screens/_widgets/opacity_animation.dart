import 'package:flutter/material.dart';

class OpacityAnimation extends StatefulWidget {
  const OpacityAnimation({
    super.key,
    required this.delayed,
    required this.duration,
    required this.curve,
    required this.child,
  });

  final int delayed;
  final int duration;
  final Curve curve;
  final Widget child;

  @override
  State<OpacityAnimation> createState() => _OpacityAnimationState();
}

class _OpacityAnimationState extends State<OpacityAnimation> {
  var _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future<void>.delayed(Duration(milliseconds: widget.delayed))
        .then((_) => setState(() => _opacity = 1));
  }

  @override
  Widget build(BuildContext context) => AnimatedOpacity(
        duration: Duration(milliseconds: widget.duration),
        curve: widget.curve,
        opacity: _opacity,
        child: widget.child,
      );
}
