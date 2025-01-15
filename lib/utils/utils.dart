import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

TextStyle myTextStyle(
  double size, [
  Color color = Colors.black,
  FontWeight fontWeight = FontWeight.normal,
]) {
  return GoogleFonts.montserrat(
    fontSize: size,
    color: color,
    fontWeight: fontWeight,
  );
}

List<String> selectableTimes = [
  '300',
  '600',
  '900',
  '1200',
  '1500',
  '1800',
  '2100',
  '2400',
  '2700',
  '3000',
  '3300',
];
