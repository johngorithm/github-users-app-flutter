import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:github_users_flutter/models/list_user.dart';
import 'package:github_users_flutter/models/user_profile.dart';

Future<List<ListUser>> fetchUsers() async {
  List<ListUser> users = [];

  http.Response response = await http.get(
      'https://api.github.com/search/users?q=+language:java+location:nairobi&per_page=100');
  if (response.statusCode == 200) {
    var data = convert.jsonDecode(response.body);
    data['items'].forEach((user) {
      users.add(ListUser.fromJSON(user));
    });
  }
  return users;
}


Future<dynamic> fetProfile(String username) async {
  Map<String, dynamic> data = {};

  http.Response response = await http.get(
      'https://api.github.com/users/$username?client_id=694ce0aafdfbc47ad583&client_secret=58709f1741ce72e8102a05b41412b38750bf1cd0');
  if (response.statusCode == 200) {
    data = convert.jsonDecode(response.body);
    return UserProfile.fromJSON(data);
  }

}