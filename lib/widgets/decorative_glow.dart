import 'package:flutter/material.dart';

class DecorativeGlow extends StatelessWidget {
  const DecorativeGlow({super.key, this.size = 220});

  final double size;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              const Color(0xFFF9AE2F).withValues(alpha: 0.25),
              const Color(0xFFF2901F).withValues(alpha: 0.08),
              Colors.transparent,
            ],
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
      ),
    );
  }
}