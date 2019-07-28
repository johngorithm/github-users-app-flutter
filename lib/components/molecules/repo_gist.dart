import 'package:flutter/material.dart';
import 'package:github_users_flutter/components/molecules/items_card.dart';
import 'package:github_users_flutter/components/atoms/followings_and_followers.dart';


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