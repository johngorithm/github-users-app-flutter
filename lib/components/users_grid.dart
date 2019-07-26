import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:github_users_flutter/models/list_user.dart';

class UsersGrid extends StatelessWidget {
  final List<ListUser> users;

  UsersGrid({this.users});

  @override
  Widget build(BuildContext context) {
    print('I am here');
    print(users.length);
    return StaggeredGridView.countBuilder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      crossAxisCount: 4,
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        print(index);
        return Text(users[index].username);
      },
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 1),
    );
  }
}
