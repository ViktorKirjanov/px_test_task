import 'package:flutter/material.dart';

class OpacityAnimation extends StatefulWidget {
  final int delayed;
  final int duration;
  final Curve curve;
  final Widget child;

  const OpacityAnimation({
    super.key,
    required this.delayed,
    required this.duration,
    required this.curve,
    required this.child,
  });

  @override
  State<OpacityAnimation> createState() => _OpacityAnimationState();
}

class _OpacityAnimationState extends State<OpacityAnimation> {
  var _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: widget.delayed))
        .then((_) => setState(() => _opacity = 1));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: widget.duration),
      curve: widget.curve,
      opacity: _opacity,
      child: widget.child,
    );
  }
}
