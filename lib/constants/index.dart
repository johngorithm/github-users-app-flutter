import 'package:flutter/material.dart';

const primaryLight = Color(0xFF313EBB);
const primaryDark = Color(0xFF2D239F);
const secondaryLight = Colors.blueAccent;
const accentColor = Color(0xFFFE7050);

const kDetailValueTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 16.0,
);

const kDetailFieldTextStyle = TextStyle(
  color: secondaryLight,
  fontSize: 16.0,
);

const kPrimaryDivider = Divider(
  height: 1.0,
  color: secondaryLight,
);

const kDecorationImage = DecorationImage(
  fit: BoxFit.fill,
  image: AssetImage(
    'images/for_geek_directory2.jpg',
  ),
);

const kCardBoxShadow = [
  BoxShadow(
    color: Colors.black12,
    blurRadius: 2.0,
    spreadRadius: 2.0,
    offset: Offset(0, 2.0),
  ),
];

const kNotProvided = 'Not provided 🧐';