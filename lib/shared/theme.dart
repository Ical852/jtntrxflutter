// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart' as intl;

String formatter(int number) {
  var formatted = intl.NumberFormat.decimalPattern().format(number);

  return formatted;
}

TextStyle robototext = GoogleFonts.roboto();

Color primaryColor = Color(0xff2787BD);
Color secondaryColor = Color(0xffC1DDED);

Color blue = Color(0xff2787BD);
Color black = Color(0xff000000);
Color blue2 = Color(0xffC1DDED);
Color grey = Color(0xff6F6F6F);
Color white = Color(0xffFFFFFF);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight blackBold = FontWeight.w900;