import "user.dart";

class Tweet {
  String id;
  String createdAt;
  User user;
  String text;
  String fullText;

  Tweet(dynamic map) {
    if (map != null) {
      id = map["id_str"] as String;
      createdAt = map["created_at"] as String;
      user = User(map["user"]);
      text = map["full_text"] as String;
      if (map["retweeted_status"] != null &&
          map["retweeted_status"]["full_text"] != null) {
        fullText = map["retweeted_status"]["full_text"] as String ?? "";
      }
    }
  }

  String get urlTweet => "https://twitter.com/${user.screenName}/status/$id";

// TODO convert date
  String get dateFormat {
    final List<String> aux = createdAt
        .replaceAll("Jan", "01")
        .replaceAll("Feb", "02")
        .replaceAll("Mar", "03")
        .replaceAll("Apr", "04")
        .replaceAll("May", "05")
        .replaceAll("Jun", "06")
        .replaceAll("Jul", "07")
        .replaceAll("Aug", "08")
        .replaceAll("Sep", "09")
        .replaceAll("Oct", "10")
        .replaceAll("Nov", "11")
        .replaceAll("Dec", "12")
        .split(" ");
    return "${aux[2]}/${aux[1]}/${aux[5]} ${aux[3]}";
  }
}
