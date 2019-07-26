class UserProfile {
  int followers;
  int following;
  String name;
  String username;
  String company;
  String avatarUrl;
  int publicRepos;
  int publicGists;
  String bio;
  String location;

  UserProfile(
      {this.username,
      this.name,
      this.followers,
      this.following,
      this.bio,
      this.location,
      this.company,
      this.avatarUrl,
      this.publicGists,
      this.publicRepos});

  factory UserProfile.fromJSON(Map<String, dynamic> data) {
    return UserProfile(
      followers: data['followers'],
      following: data['following'],
      name: data['name'],
      username: data['login'],
      avatarUrl: data['avatar_url'],
      location: data['location'],
      company: data['company'],
      bio: data['bio'],
      publicGists: data['public_repos'],
      publicRepos: data['public_repos']
    );
  }
}
