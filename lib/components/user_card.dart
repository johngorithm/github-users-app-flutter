import 'package:flutter/material.dart';
import 'package:github_users_flutter/models/list_user.dart';


class UserCard extends StatelessWidget {
  final ListUser user;

  UserCard({this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFF2D239F),
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          )),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 80.0,
              width: 80.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: Colors.white,
                    width: 2.0
                ),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(user.avatarUrl),
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              user.username,
              style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.white
              ),
            ),
          ],
        ),
      ),
    );
  }
}
