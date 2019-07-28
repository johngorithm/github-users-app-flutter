import 'package:flutter/material.dart';
import 'package:github_users_flutter/constants/index.dart';

class FollowingsAndFollowers extends StatelessWidget {
  final String value;
  final String field;

  FollowingsAndFollowers({this.value, this.field});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            value,
            style: TextStyle(
              fontSize: 27.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            field,
            style: TextStyle(
              fontSize: 14.0,
              color: secondaryLight,
            ),
          )
        ],
      ),
    );
  }
}