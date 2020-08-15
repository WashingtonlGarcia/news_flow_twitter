import "package:intl/intl.dart";

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
        .replaceAll("Sat", "Sáb")
        .replaceAll("Sun", "Dom")
        .replaceAll("Mon", "Seg")
        .replaceAll("Tue", "Ter")
        .replaceAll("Sat", "Qua")
        .replaceAll("Thu", "Qui")
        .replaceAll("Fri", "Sex")
        .replaceAll("Sun", "Dom")
        .split(" ");

    return DateFormat("dd/MM/yyyy hh:mm", "pt_Br").format(
        DateTime.parse("${aux[5]}-${aux[1]}-${aux[2]} ${aux[3]}")
            .subtract(const Duration(hours: 3)));
  }
}
