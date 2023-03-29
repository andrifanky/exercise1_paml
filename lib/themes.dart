import 'package:flutter/material.dart';

const double defaultMargin = 18;
const double defaultRadius = 6;

const Color kBlackColor = Color(0xff000000);
const Color kWhiteColor = Color(0xffFFFFFF);
const Color kGreyColor = Color(0xff999999);
const Color kDarkGreyColor = Color(0xff657786);
const Color kLightGreyColor = Color(0xffAAB8C2);
const Color kYellowColor = Color(0xffECAD00);
const Color kBlueColor = Color(0xff2196F3);

TextStyle regularBlackTextStyle = const TextStyle(
  color: kBlackColor
);

TextStyle regularBlackBoldTextStyle = TextStyle(
  color: kBlackColor,
  fontWeight: bold
);

TextStyle regularWhiteTextStyle = const TextStyle(
  color: kWhiteColor
);

TextStyle regularDarkGreyTextStyle = const TextStyle(
  color: kDarkGreyColor
);

TextStyle regularDarkGreyBoldTextStyle = TextStyle(
  color: kDarkGreyColor,
  fontWeight: bold
);

TextStyle regularBlueBoldTextStyle = TextStyle(
  color: kBlueColor,
  fontWeight: bold
);

TextStyle regularYellowMediumTextStyle = TextStyle(
  color: kYellowColor,
  fontWeight: medium
);

TextStyle h1YellowTextStyle = TextStyle(
  color: kYellowColor,
  fontSize: 26,
  fontWeight: semiBold
);

TextStyle buttonBlackTextStyle = TextStyle(
  color: kBlackColor,
  fontSize: 15,
  fontWeight: semiBold
);

TextStyle buttonWhiteTextStyle = TextStyle(
  color: kWhiteColor,
  fontSize: 15,
  fontWeight: semiBold
);

TextStyle inputTextStyle = const TextStyle(
  color: kBlackColor
);

TextStyle mediumBlackTextStyle = TextStyle(
  color: kBlackColor,
  fontSize: 13,
  fontWeight: semiBold
);

TextStyle mediumWhiteTextStyle = TextStyle(
  color: kWhiteColor,
  fontSize: 13,
  fontWeight: semiBold
);

TextStyle smallBlackTextStyle = const TextStyle(
  color: kBlackColor,
  fontSize: 12
);

TextStyle smallWhiteTextStyle = const TextStyle(
  color: kWhiteColor,
  fontSize: 12
);

TextStyle verySmallBlackTextStyle = const TextStyle(
  color: kBlackColor,
  fontSize: 11
);

FontWeight thin = FontWeight.w100;
FontWeight extraLight = FontWeight.w200;
FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;
