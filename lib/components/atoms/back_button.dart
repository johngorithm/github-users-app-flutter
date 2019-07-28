import 'package:flutter/material.dart';
import 'package:github_users_flutter/constants/index.dart';

class BackBtn extends StatelessWidget {
  final Function onPress;

  BackBtn({this.onPress});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10.0,
      left: 15.0,
      child: GestureDetector(
        onTap: onPress,
        child: Icon(
          Icons.arrow_back,
          color: primaryDark,
        ),
      ),
    );
  }
}
