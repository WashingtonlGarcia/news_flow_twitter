import "package:meta/meta.dart";

class User {
  String id;
  String name;
  String screenName;
  String profileImageUrl;

  User({
    @required this.id,
    @required this.name,
    @required this.screenName,
    @required this.profileImageUrl,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        id: map["id_str"] as String,
        name: map["name"] as String,
        screenName: map["screen_name"] as String,
        profileImageUrl: map["profile_image_url"] as String ?? " ");
  }
}
