import 'package:flutter/material.dart';

class AppAssets {
  static const String splashScreenBg = 'assets/images/qoruz logo.png';
  static const String activityIcon = 'assets/images/activity.png';
  static const String profileIcon = 'assets/images/profile.png';
  static const String searchIcon = 'assets/images/search.png';
  static const String marketPlaceIcon = 'assets/images/marketPlace.png';
  static const String menuIcon = 'assets/images/menu.png';
  static const String textFieldPicture = 'assets/images/textFieldPicture.png';
  static const String leftArrowIcon = 'assets/images/leftArrow.png';
  static const String trashIcon = 'assets/images/trash.png';
  static const String shareIcon = 'assets/images/share.png';
  static const String linkedInLogo = 'assets/images/linkedInLogo.png';
  static const String whatsAppLogo = 'assets/images/whatsAppLogo.png';
  static const String verified = 'assets/images/verified.png';
  static const String clock = 'assets/images/clock.png';
  static const String people = 'assets/images/people.png';
  static const String category = 'assets/images/category.png';
  static const String instagram = 'assets/images/instagram.png';
  static const String location = 'assets/images/location.png';
}

class AppColors {
  static const Color primaryColor = Colors.black;
  static const Color white = Colors.white;
  static Color subHeadingColor = Color(0XFF7E7E7E);
  static Color cardBorderColor = Color(0xFFCACACA);
  static Color cardDetailTextBlackColor = Color(0xFF1F1F1F);
  static Color cardDetailTextGreyColor = Color(0xFF7E7E7E);
  static Color cardHighlighsGreyColor = Color(0xFFF5F6FB);
  static Color dividerGreyColor = Color(0xFFE9E9E9);
  static Color textGreyColor = Color(0xFFAAAAAA);
  static Color boxShadowColor = Color(0x1F1F1F0F);
  static Color seletedChipColor = Color(0xFFFE4545);
  static Color seletedChipLightColor = Color(0xFFFFEFEF);
  static Color linkedInButtonColor = Color.fromARGB(31, 0, 102, 200);
  static Color whatsAppButtonColor = Color.fromARGB(31, 11, 220, 78);
}

class AppTextStyles {
  static TextStyle chipStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 20 / 14,
    decoration: TextDecoration.none,
    textBaseline: TextBaseline.alphabetic,
  );

  static TextStyle marketListProfileNameStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 20 / 14,
    textBaseline: TextBaseline.alphabetic,
  );

  static TextStyle marketListProfileDesignationStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 16 / 12,
    textBaseline: TextBaseline.alphabetic,
    color: AppColors.subHeadingColor,
  );

  static TextStyle marketListProfileLastSeenStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 10,
    fontWeight: FontWeight.w400,
    height: 12 / 10,
  );
  static TextStyle marketListServiceTypeStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 16 / 12,
  );
  static TextStyle marketListDetailStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 20 / 14,
    decorationStyle: TextDecorationStyle.solid,
    decorationThickness: 1.0,
    color: AppColors.primaryColor,
  );
  static TextStyle marketListHighlightTagStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 11,
    fontWeight: FontWeight.w400,
    height: 20 / 11,
    decorationStyle: TextDecorationStyle.solid,
    decorationThickness: 1.0,
    color: AppColors.cardDetailTextGreyColor,
  );
  static TextStyle marketDetailCreatedAtStyle = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 16 / 12,
    letterSpacing: 0,
  );

  static TextStyle marketDetailTextStyle = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 25 / 16,
    letterSpacing: 0,
    color: AppColors.primaryColor,
  );

  static TextStyle marketDetailKeyHighlightsTextStyle = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 14.52 / 12,
    letterSpacing: 0,
    color: AppColors.cardDetailTextBlackColor,
  );
}
