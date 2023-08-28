// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';

class CostWidget extends StatelessWidget {
  final Color color;
  final double cost;
  const CostWidget({
    Key? key,
    required this.color,
    required this.cost,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "₹",
          style: TextStyle(fontSize: 10, color: color, fontFeatures: const [
            FontFeature.superscripts(),
          ]),
        ),
        Text(
          cost.toInt().toString(),
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w800, color: color),
        ),
        Text(
          (cost - cost.toInt()).toString(),
          style: TextStyle(color: color, fontSize: 10, fontFeatures: const [
            FontFeature.superscripts(),
          ]),
        ),
      ],
    );
  }
}
