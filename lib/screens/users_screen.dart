import 'package:flutter/material.dart';

import 'package:github_users_flutter/models/list_user.dart';
import 'package:github_users_flutter/services/api_service.dart';

import 'package:github_users_flutter/components/users_grid.dart';


class UsersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Text(
                'Geek Directory',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FutureBuilder(
              future: fetchUsers(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 100.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Expanded(
                    child: Center(
                      child: Text('Oop!... Something went wrong. Mind trying again?'),
                    ),
                  );
                } else if (snapshot.hasData) {
                  List<ListUser> users = snapshot.data;
                  return UsersGrid(users: users);
                } else {
                  return Expanded(
                    child: Text(
                      'Not sure what went wrong. Mind trying again?',
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

