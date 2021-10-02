import 'package:flutter/material.dart';

Color darken(Color c, [int percent = 10]) {
  assert(1 <= percent && percent <= 100);
  var f = 1 - percent / 100;
  return Color.fromARGB(c.alpha, (c.red * f).round(), (c.green * f).round(),
      (c.blue * f).round());
}

/// Lighten a color by [percent] amount (100 = white)
Color lighten(Color c, [int percent = 65]) {
  assert(1 <= percent && percent <= 100);
  var p = percent / 100;
  return Color.fromARGB(
      c.alpha,
      c.red + ((255 - c.red) * p).round(),
      c.green + ((255 - c.green) * p).round(),
      c.blue + ((255 - c.blue) * p).round());
}

class AppColors {
  AppColors._();
  static const Color Grey = Color(0xff8D9091);
  static const Color lightGreen = Color(0xff62C6B7);
  static const Color Red = Color(0xffC5292A);
  static const Color White = Color(0xffffffff);
  static const Color greyWhite = Color(0xffF7FCFC);
  static const Color appBackColor = Color(0xffE5E5E5);
  static const Color greenishWhite = Color(0xffE4EEEE);
  static const Color deepGreen = Color(0xff2F626E);
  static const Color lightDeepGreen = Color(0xff3D7F8F);
  static const Color appLightPrimaryColor = Color(0xffEFF9F8);
  static const Color LighterGreen = Color(0xffC7EBE5);


}
