class User {
  String id;
  String name;
  String screenName;
  String profileImageUrl;

  User(dynamic map) {
    id = map["id_str"] as String;
    name = map["name"] as String;
    screenName = map["screen_name"] as String;
    profileImageUrl = map["profile_image_url"] as String ?? " ";
  }
}
