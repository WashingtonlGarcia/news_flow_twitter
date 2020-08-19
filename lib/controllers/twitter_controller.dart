import "dart:convert";

import "package:flutter_dotenv/flutter_dotenv.dart";

import "package:twitter_api/twitter_api.dart";

import "../models/tweet.dart";

class TwitterController {
  final twitterApi _twitterRequest = twitterApi(
      consumerKey: DotEnv().env["CONSUMER_KEY"],
      consumerSecret: DotEnv().env["CONSUMER_SECRET"],
      token: DotEnv().env["TOKEN"],
      tokenSecret: DotEnv().env["TOKEN_SECRET"]);

  Future<List<Tweet>> getListTweet(String userName) async {
    final dynamic res = await _twitterRequest.getTwitterRequest(
        "GET", "statuses/user_timeline.json",
        options: <String, String>{
          "screen_name": userName,
          "count": "300",
          "tweet_mode": "extended",
        });
    if (res.body == null) return null;
    final dynamic response = json.decode(res.body.toString());

    final List<Tweet> listTweets = <Tweet>[];
    for (final dynamic tweet in response) {
      listTweets.add(Tweet(tweet));
    }

    return listTweets.toList();
  }
}
