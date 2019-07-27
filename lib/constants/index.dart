import 'package:flutter/material.dart';


const primaryLight = Color(0xFF313EBB);
const primaryDark = Color(0xFF2D239F);
const secondaryLight = Colors.blueAccent;

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