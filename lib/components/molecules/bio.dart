import 'package:flutter/material.dart';
import 'package:github_users_flutter/constants/index.dart';
import 'package:github_users_flutter/components/molecules/items_card.dart';



class Bio extends StatelessWidget {
  final String bio;

  Bio({this.bio});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ItemsCard(
        margin: EdgeInsets.only(
          left: 15.0,
          right: 15.0,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 20.0,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                'Bio',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: secondaryLight,
                  fontSize: 20.0,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                bio != null ? bio.trim() : kNotProvided,
                textAlign: TextAlign.left,
              ),
            )
          ],
        ),
      ),
    );
  }
}
