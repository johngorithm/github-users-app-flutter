import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:github_users_flutter/constants/index.dart';
import 'package:github_users_flutter/components/profile_body.dart';



class ProfileScreen extends StatelessWidget {
  final String username;
  final Future<dynamic> profileData;

  ProfileScreen({this.profileData, this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryLight,
      body: FutureBuilder(
        future: profileData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Oop!... Something went wrong. Mind trying again?'),
            );
          } else if (snapshot.hasData) {
            return ProfileBody(data: snapshot.data);
          } else {
            return Center(
              child: Text(
                'Not sure what went wrong. Mind trying again?',
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: accentColor,
        onPressed: () {
          Share.share(
              'Checkout this awesome developer @$username https://github.com/$username');
        },
        child: Icon(
          Icons.share,
          color: Colors.white,
        ),
      ),
    );
  }
}

