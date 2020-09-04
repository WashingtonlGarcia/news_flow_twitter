import "dart:convert";

import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:news_flow/services/firebase_service.dart";

import "package:twitter_api/twitter_api.dart";

import "../models/tweet.dart";

class TwitterService {
  final twitterApi _twitterRequest = twitterApi(
      consumerKey: DotEnv().env["CONSUMER_KEY"],
      consumerSecret: DotEnv().env["CONSUMER_SECRET"],
      token: DotEnv().env["TOKEN"],
      tokenSecret: DotEnv().env["TOKEN_SECRET"]);

  Future<List<Tweet>> getListTweet(String userName) async {
    final dynamic res = await _twitterRequest.getTwitterRequest("GET", "statuses/user_timeline.json", options: <String, String>{
      "screen_name": userName,
      "count": "50",
      "tweet_mode": "extended",
    });
    if (res.body == null) return null;
    final dynamic response = json.decode(res.body.toString());

    final List<Tweet> listTweets = <Tweet>[];
    for (final dynamic tweet in response) {
      final Tweet res = Tweet.from(tweet);
      res.score = await FirebaseService().callClassification(res.fullText ?? res.text) as String;
      listTweets.add(res);
    }

    return listTweets.toList();
  }
}
