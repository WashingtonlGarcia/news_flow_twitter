import "package:flutter/material.dart";

import "package:url_launcher/url_launcher.dart";
import "package:news_flow/models/tweet.dart";

import "package:news_flow/widgets/circle_avatar_widget.dart";

class ListTileTweetWidget extends StatelessWidget {
  final Tweet tweet;

  const ListTileTweetWidget({@required this.tweet});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 4, left: 4),
                child: CircleAvatarWidget(imageUrl: tweet.user.profileImageUrl),
              ),
              const SizedBox(
                width: 4,
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            tweet.user.name,
                            overflow: TextOverflow.ellipsis,
                            style: _textStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        Text(
                          tweet.dateFormat,
                          style: _textStyle(fontSize: 10),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "@${tweet.user.screenName}",
                            overflow: TextOverflow.ellipsis,
                            style: _textStyle(fontWeight: FontWeight.w500, fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).backgroundColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[Expanded(child: Text(tweet.fullText ?? tweet.text))],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(
                tweet.score == "[-1]" ? Icons.trending_down : tweet.score == "[1]" ? Icons.trending_up : Icons.trending_flat,
                color: tweet.score == "[-1]" ? Colors.red : tweet.score == "[1]" ? Colors.green : Colors.grey,
              ),
              FlatButton(
                  textColor: Theme.of(context).accentColor,
                  onPressed: () {
                    launch(tweet.urlTweet);
                  },
                  child: const Text("Ver mais"))
            ],
          )
        ],
      ),
    );
  }

  TextStyle _textStyle({double fontSize = 12, FontWeight fontWeight = FontWeight.normal}) => TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
      );
}
