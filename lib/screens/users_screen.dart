import 'package:flutter/material.dart';
import 'package:github_users_flutter/constants/index.dart';

import 'package:github_users_flutter/models/list_user.dart';

import 'package:github_users_flutter/components/users_grid.dart';

const snackBar = SnackBar(
  content: Text('No Internet Connection. Mind Trying Again'),
);

class UsersScreen extends StatelessWidget {
  final Future<List<ListUser>> users;

  UsersScreen({this.users});

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
              future: users,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.active:
                  case ConnectionState.waiting:
                    return Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  case ConnectionState.none:
                    return unknownIOError();
                  case ConnectionState.done:
                    if (snapshot.hasData) {
                      List<ListUser> users = snapshot.data;
                      return UsersGrid(users: users);
                    }

                    if (snapshot.error
                        .toString()
                        .startsWith('SocketException')) {
                      return networkErrorView(
                          'Not Internet Connection.\nMind Trying again');
                    }
                    return networkErrorView('Network Error. Mind trying again');

                  default:
                    return unknownIOError();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget unknownIOError() {
  return Expanded(
    child: Center(
      child: Text(
        'No sure what went wrong. Mind trying again?',
      ),
    ),
  );
}

Widget networkErrorView(String message) {
  return Expanded(
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.signal_cellular_connected_no_internet_4_bar,
            color: primaryDark,
            size: 50.0,
          ),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              color: secondaryLight,
            ),
          )
        ],
      ),
    ),
  );
}
