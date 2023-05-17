import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BackgroundCircle extends StatelessWidget {
  final circleBorderWidth;
  final circleOpacity;
  final circleWidth;
  final circleColor;
  const BackgroundCircle(
      {super.key,
      required this.circleBorderWidth,
      required this.circleColor,
      required this.circleOpacity,
      required this.circleWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: circleWidth,
      height: circleWidth,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: circleBorderWidth,
          color: circleColor.withOpacity(circleOpacity),
        ),
      ),
    );
  }
}
