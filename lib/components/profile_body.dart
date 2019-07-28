
import 'package:flutter/material.dart';
import 'package:github_users_flutter/models/user_profile.dart';
import 'package:github_users_flutter/constants/index.dart';
import 'package:github_users_flutter/components/atoms/detail_item.dart';
import 'package:github_users_flutter/components/molecules/items_card.dart';

import 'package:github_users_flutter/components/atoms/back_button.dart';
import 'package:github_users_flutter/components/atoms/followings_and_followers.dart';
import 'package:github_users_flutter/components/atoms/image_caption.dart';
import 'package:github_users_flutter/components/molecules/repo_gist.dart';
import 'package:github_users_flutter/components/molecules/bio.dart';

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
          padding: EdgeInsets.only(top: 35.0),
          decoration: BoxDecoration(
            color: Colors.white,
            image: kDecorationImage,
          ),
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              BackBtn(
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
                          color: Color(0x25000000),
                          blurRadius: 10.0,
                          spreadRadius: 6,
                          offset: Offset(0, 5.0),
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
                value: data.name ?? kNotProvided,
              ),
              kPrimaryDivider,
              DetailItem(
                field: 'Company',
                value: data.company ?? kNotProvided,
              ),
              kPrimaryDivider,
              DetailItem(
                field: 'Location',
                value: data.location ?? kNotProvided,
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
