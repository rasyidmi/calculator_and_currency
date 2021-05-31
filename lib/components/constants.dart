import 'package:flutter/material.dart';

// const Color primaryColor2 = Color(0xff0070F3);

const Color primaryColor = Color(0xff5038BC);

const Color secondaryColor = Color(0xffbebbf4);

const Color highlightedColor = Color(0xFFE2F5F8);

// const Color backgroundColor = Color(0xFFF8F8FF);
const Color backgroundColor = Colors.white;

const double numberFontSize = 50; 

final Shader gradientText = LinearGradient(
      colors: <Color>[primaryColor, secondaryColor],
    ).createShader(Rect.fromLTWH(150.0, 0.0, 100.0, 0.0));