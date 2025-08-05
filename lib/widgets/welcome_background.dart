import 'package:flutter/material.dart';

welcomeBackground({double? top, double? right, double? left, double? bottom}) {
  return Positioned(
    top: top,
    right: right,
    left: left,
    bottom: bottom,
    child: Container(
      width: 450,
      height: 400,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 236, 237, 247),
        shape: BoxShape.circle,
      ),
    ),
  );
}
