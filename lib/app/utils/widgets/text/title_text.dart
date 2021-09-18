import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../color_helper.dart';

class TitleText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  const TitleText(
      {required this.text,
        this.fontSize = 18,
        this.color = ColorHelper.navyBlue2})
      : super();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:10.0, bottom: 5.0),
      child: Text(text,
          textAlign: TextAlign.left,
          style: GoogleFonts.mulish(
              fontSize: fontSize, fontWeight: FontWeight.w800, color: color))
    );
  }
}