import 'package:flutter/material.dart';

import 'colors.dart';

class CustomBodyBackground extends StatelessWidget {
  const CustomBodyBackground({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [ColorsTheme().primaryColor, ColorsTheme().backgroundColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}
