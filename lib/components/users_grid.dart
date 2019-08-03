import 'package:flutter/material.dart';
import 'package:github_users_flutter/models/list_user.dart';
import 'package:github_users_flutter/components/user_card.dart';
import 'package:github_users_flutter/screens/profile_screen.dart';
import 'package:github_users_flutter/services/api_service.dart';

class UsersGrid extends StatelessWidget {
  final List<ListUser> users;

  UsersGrid({this.users});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
        child: GridView.count(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10.0,
          children: List.generate(users.length, (index) {
            ListUser user = users[index];

            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  String username = user.username;
                  return ProfileScreen(
                    username: username,
                    profileData: fetProfile(username),
                  );
                }));
              },
              child: UserCard(user: user),
            );
          }),
        ),
      ),
    );
  }
}
