
class ListUser {
  String username;
  String avatarUrl;

  ListUser({this.avatarUrl, this.username});

  factory ListUser.fromJSON(Map<String, dynamic> data) {
    return ListUser(
      username: data['login'] ?? '',
      avatarUrl: data['avatar_url'] ?? '',
    );
  }
}