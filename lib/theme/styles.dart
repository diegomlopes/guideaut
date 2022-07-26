import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guideaut/theme/colors.dart';

ButtonStyle? menuButtonStyle = TextButton.styleFrom(
  backgroundColor: Colors.transparent,
  onSurface: null,
  primary: textSecondary,
  textStyle: buttonTextStyle,
  padding: const EdgeInsets.symmetric(
    horizontal: 16, 
    vertical: 16
  ),
);
  
TextStyle buttonTextStyle = GoogleFonts.montserrat(
  textStyle: const TextStyle(
    fontSize: 14, 
    color: textPrimary, 
    letterSpacing: 1,
  ),
);

ButtonStyle? middleButtonStyle = TextButton.styleFrom(
  backgroundColor: Colors.transparent,
  onSurface: null,
  primary: textSecondary,
  textStyle: buttonMiddleBarTextStyle,
  // padding: const EdgeInsets.symmetric(
  //   horizontal: 8, 
  //   vertical: 8
  // ),
);

TextStyle buttonMiddleBarTextStyle = GoogleFonts.montserrat(
  textStyle: const TextStyle(
    fontSize: 10, 
    color: textPrimary, 
    // letterSpacing: 1,
  ),
);

TextStyle imageHomeTitleTextStyle = GoogleFonts.montserrat(
  textStyle: const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold, 
    color: textPrimary, 
    // letterSpacing: 1,
  ),
);

TextStyle imageHomeTextStyle = GoogleFonts.montserrat(
  textStyle: const TextStyle(
    fontSize: 14, 
    color: textPrimary, 
    // letterSpacing: 1,
  ),
);