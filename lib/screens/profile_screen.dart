import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:github_users_flutter/models/user_profile.dart';
import 'package:github_users_flutter/constants/index.dart';

class ProfileScreen extends StatelessWidget {
  final String username;

  ProfileScreen({this.username});

  Future<dynamic> fetProfile() async {
    Map<String, dynamic> data = {};

    http.Response response = await http.get(
        'https://api.github.com/users/$username?client_id=694ce0aafdfbc47ad583&client_secret=58709f1741ce72e8102a05b41412b38750bf1cd0');
    if (response.statusCode == 200) {
      data = convert.jsonDecode(response.body);
    }

    return UserProfile.fromJSON(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryLight,
      body: FutureBuilder(
        future: fetProfile(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(100.0),
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasError) {
            return Container(
              child: Center(
                child: Text('Oop!... Something went wrong'),
              ),
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
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {

        },
        child: Icon(
          Icons.share,
          color: primaryDark,
        ),
      ),
    );
  }
}

class ProfileBody extends StatelessWidget {
  final UserProfile data;

  ProfileBody({this.data});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 0, bottom: 30.0, right: 0, left: 0),
      children: <Widget>[
        Container(
          height: 250.0,
          padding: EdgeInsets.only(top: 25.0),
          decoration: BoxDecoration(
            color: Colors.white,
            image: kDecorationImage,
          ),
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              BackButton(
                onPress: () {
                  Navigator.pop(context);
                },
              ),
              Positioned(
                height: 100.0,
                left: 30.0,
                right: 30.0,
                bottom: -45.0,
                child: Container(
                  padding: EdgeInsets.only(right: 15.0),
                  decoration: BoxDecoration(
                      color: primaryDark,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5.0,
                          spreadRadius: 5,
                        ),
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FollowingsAndFollowers(
                        value: data.followers.toString(),
                        field: 'Follower',
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      FollowingsAndFollowers(
                        value: data.following.toString(),
                        field: 'Following',
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 40.0,
                bottom: -30.0,
                child: ImageCaption(
                  username: data.username,
                  imageUrl: data.avatarUrl,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 70.0,
        ),
        /**
         * End of top user caption.
         * Beginning of user details
         */
        ItemsCard(
          margin: EdgeInsets.only(left: 15.0, right: 15.0),
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Column(
            children: <Widget>[
              DetailItem(
                field: 'Name',
                value: data.name ?? 'N/A',
              ),
              kPrimaryDivider,
              DetailItem(
                field: 'Company',
                value: data.company ?? 'N/A',
              ),
              kPrimaryDivider,
              DetailItem(
                field: 'Location',
                value: data.location ?? 'N/A',
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        /**
         * End of Details.
         * Beginning of repoGist data.
         */
        RepoGist(
          repoCount: data.publicRepos.toString(),
          gistCount: data.publicGists.toString(),
        ),
        SizedBox(
          height: 15,
        ),
        /**
         * End of user repoGist.
         * Beginning of bio.
         */
        Bio(bio: data.bio),
      ],
    );
  }
}

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

class ImageCaption extends StatelessWidget {
  final String imageUrl;
  final String username;

  ImageCaption({this.username, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 100.0,
          width: 100.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 3.0, color: Colors.white),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          username,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ],
    );
  }
}

class BackButton extends StatelessWidget {
  final Function onPress;

  BackButton({this.onPress});

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

class ItemsCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets margin;
  final EdgeInsets padding;

  ItemsCard({@required this.child, this.margin, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: primaryDark,
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2.0,
            spreadRadius: 2.0,
            offset: Offset(0, 2.0),
          ),
        ],
      ),
      child: child,
    );
  }
}

class DetailItem extends StatelessWidget {
  final String field;
  final String value;

  DetailItem({this.field, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 20.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Text(
              field,
              style: kDetailFieldTextStyle,
            ),
          ),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  style: kDetailValueTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
                bio ?? 'Not provide 🧐',
                textAlign: TextAlign.left,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RepoGist extends StatelessWidget {
  final String repoCount;
  final String gistCount;

  RepoGist({this.gistCount, this.repoCount});

  @override
  Widget build(BuildContext context) {
    return ItemsCard(
      margin: EdgeInsets.only(
        left: 15.0,
        right: 15.0,
      ),
      padding: EdgeInsets.only(
        top: 30.0,
        bottom: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FollowingsAndFollowers(
            field: 'Repos',
            value: repoCount,
          ),
          FollowingsAndFollowers(
            field: 'Gists',
            value: gistCount,
          )
        ],
      ),
    );
  }
}
