import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final int currentIndex;
  final int count;
  final double dotSize;
  final Color activeColor;
  final Color borderColor;
  final double spacing;
  final double borderWidth;

  const Indicator({
    super.key,
    required this.currentIndex,
    required this.count,
    this.dotSize = 8.0,
    this.activeColor = Colors.lightBlue,
    this.borderColor = Colors.lightBlue,
    this.spacing = 8.0,
    this.borderWidth = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: spacing / 2),
          width: dotSize,
          height: dotSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentIndex == index ? activeColor : Colors.transparent,
            border: Border.all(
              color: borderColor,
              width: borderWidth,
            ),
          ),
        );
      }),
    );
  }
}
