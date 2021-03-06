import 'dart:ui';
import 'package:flutter/cupertino.dart';

class ColorHelper {
  static Color primaryGradientTop = Color.fromRGBO(0, 71, 143, 1);
  static Color primaryGradientBottom = Color.fromRGBO(0, 71, 143, 1);
  static Color whiteColor = Color.fromRGBO(255, 255, 255, 1);
  static Color blackColor = Color.fromRGBO(0, 0, 0, 1);
  static Color textDullWhiteHint = Color.fromRGBO(247, 248, 250, 0.55);
  static Color conversationHeader = Color.fromRGBO(247, 248, 250, 1);
  static Color noFocusTextFieldOutlineDullWhite =
      Color.fromRGBO(255, 255, 255, 0.4);
  static Color buttonBackgroundDefault = Color.fromRGBO(255, 255, 255, 0.5);
  static Color chatNameTitle = Color.fromRGBO(112, 112, 112, 1);
  static Color newMessageCount = Color.fromRGBO(255, 65, 0, 1);
  static Color chatRoomMessageColor = Color.fromRGBO(172, 177, 192, 1);
  static Color chatRoomBottomNavIconColor = Color.fromRGBO(157, 157, 157, 1);
  static Color dropShadowColor = Color.fromRGBO(0, 0, 0, 0.1);
  static Color conversationScreenMessageColor = Color.fromRGBO(249, 172, 93, 1);
  static Color buttonColorServiceProvider = Color.fromRGBO(163, 15, 104, 1);
  static Color ratingStarsServiceProvider = Color.fromRGBO(255, 190, 0, 1);
  static Color descriptionOfEventServiceProviderHire =
      Color.fromRGBO(240, 240, 240, 1);
  static Color greyText = Color.fromRGBO(0, 0, 0, 0.5);
  static Color textFieldFillColor = Color.fromRGBO(0, 0, 0, 0.2);
  static Color almostBlackText = Color.fromRGBO(34, 34, 34, 1);
  static Color languageOptions = Color.fromRGBO(119, 131, 143, 1);

  static Gradient primaryAppGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      ColorHelper.primaryGradientTop,
      ColorHelper.primaryGradientBottom,
    ],
  );

  static const Color background = Color(0XFFFFFFFF);

  static const Color titleTextColor = const Color(0xff1d2635);
  static const Color subTitleTextColor = const Color(0xff797878);

  static const Color lightBlue1 = Color(0xff375efd);
  static const Color lightBlue2 = Color(0xff3554d3);
  static const Color navyBlue1 = Color(0xff15294a);
  static const Color lightNavyBlue = Color(0xff6d7f99);
  static const Color navyBlue2 = Color(0xff2c405b);

  static const Color yellow = Color(0xfffbbd5c);
  static const Color yellow2 = Color(0xffe7ad03);

  static const Color lightGrey = Color(0xfff1f1f3);
  static const Color grey = Color(0xffb9b9b9);
  static const Color darkgrey = Color(0xff625f6a);

  static const Color black = Color(0xff040405);
  static const Color lightblack = Color(0xff3E404D);

}
