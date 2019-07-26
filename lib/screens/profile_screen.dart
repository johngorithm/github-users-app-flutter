import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:github_users_flutter/models/user_profile.dart';

class ProfileScreen extends StatelessWidget {
  final String username;

  ProfileScreen({this.username});

  Future<dynamic> fetProfile() async {

//    if (username == null) {
//      return;
//    }
    var data;

    http.Response response = await http.get(
        'https:///api.github.com/users/$username?client_id=694ce0aafdfbc47ad583&client_secret=58709f1741ce72e8102a05b41412b38750bf1cd0');
    if (response.statusCode == 200) {
      data = convert.jsonDecode(response.body);
    }

    return UserProfile.fromJSON(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: fetProfile(),
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
              return ProfileBody(data: snapshot.data);
            } else {
              return Center(
                child: Text(
                  'I don\'t understand what happend',
                ),
              );
            }
          },
        )
      ),
    );
  }
}

class ProfileBody extends StatelessWidget {
  final UserProfile data;

  ProfileBody({this.data});


  @override
  Widget build(BuildContext context) {
    print('We are here');
    return Container(
      child: Center(
        child: Text(data.name),
      ),
    );
  }
}
