import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:github_users_flutter/models/list_user.dart';
import 'package:github_users_flutter/screens/profile_screen.dart';


Future<dynamic> fetchUsers() async {
  List<ListUser> users = [];

  http.Response response = await http.get(
      'https://api.github.com/search/users?q=+language:java+location:nairobi&per_page=100');
  if (response.statusCode == 200) {
    var data = convert.jsonDecode(response.body);
    data['items'].forEach((user) {
      users.add(ListUser.fromJSON(user));
    });
    return users;
  }
}

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
                  return Center(
                    child: Text('Oop!... Something went wrong'),
                  );
                } else if (snapshot.hasData) {
//                  print('Here');
//                  return Expanded(
//                    child: UsersGrid(
//                      users: snapshot.data,
//                    ),
//                  );
                  List<ListUser> users = snapshot.data;
                  return Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.only(
                              left: 10.0,
                              right: 10.0,
                              bottom: 0.0),
                      child: GridView.count(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10.0,
                        children: List.generate(users.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return ProfileScreen(username: users[index].username);
                              }));
                            },
                            child: UserCard(user: users[index]),
                          );
                        }),
                      ),
                    ),
                  );
                } else {
                  return Text(
                    'I don\'t understand what happend',
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
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
