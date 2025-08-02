import 'package:flutter/material.dart';

class ColorsTheme {
  // Private constructor to prevent external instantiation
  ColorsTheme._();

  // Static instance of the class
  static final ColorsTheme _instance = ColorsTheme._();

  // Factory constructor to return the same instance
  factory ColorsTheme() => _instance;

  // Primary color and its shades (updated to black-based)
  final primaryColor = const Color(0xFF000000); // Black (from logo)
  final primaryLight = const Color(0xFF4A4A4A); // Dark Gray (lighter shade)
  final primaryDark = const Color(0xFF1C2526); // Very Dark Gray (darker shade)

  // Accent color for highlights
  final accentColor = const Color(0xFF27AE60); // Soft Green (retained)

  // Neutral colors (aligned with logo colors)
  final whiteColor = const Color(0xFFFFFFFF); // White (from logo)
  final blackColor = const Color(0xFF000000); // Black (from logo)
  final grayColor = const Color(0xFF808080); // Medium Gray (from logo)
  final backgroundColor = const Color(
    0xFFF5F7FA,
  ); // Light Grayish Blue (retained)
  final cardColor = const Color(0xFFFFFFFF); // White (retained)

  // Error color
  final errorColor = Colors.red;

  // Additional gray shades for flexibility
  final lightGray = const Color(0xFFD3D3D3); // Light Gray
  final darkGray = const Color(0xFF4A4A4A); // Dark Gray
}
