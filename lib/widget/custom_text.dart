import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText(
    this.text, {
    super.key,
    this.color = const Color(0xFF3D3D3D),
    this.fontSize,
    this.height,
    this.letterSpacing,
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.start,
    this.decoration = TextDecoration.none,
    this.decorationThickness = 1,
    this.decorationStyle,
    this.overflow,
    this.maxLines,
  });

  final String text;
  final Color? color;
  final double? fontSize;
  final double? height;
  final double? letterSpacing;
  final int? maxLines;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final double? decorationThickness;
  final TextDecorationStyle? decorationStyle;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      maxLines: maxLines,
      textAlign: textAlign,
      style: GoogleFonts.openSans(
        color: color,
        height: height,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: decoration,
        letterSpacing: letterSpacing,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
      ),
    );
  }
}
