import "package:flutter/material.dart";
import "package:flutter_icons/flutter_icons.dart";

import "package:news_flow/controllers/twitter_controller.dart";
import "package:news_flow/models/tweet.dart";
import "package:news_flow/widgets/center_indicator_widget.dart";

import "package:news_flow/widgets/input_search_widget.dart";
import "package:news_flow/widgets/list_tile_tweet_widget.dart";
import "package:news_flow/widgets/message_widget.dart";

class HomePage extends StatefulWidget {
  static const String routeName = "/";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Tweet>> listFutureTweets;

  TextEditingController textEditingController = TextEditingController();
  String search;
  FocusNode focusNode = FocusNode();

  void submitForm() {
    setState(() {
      search = textEditingController.text;
    });
  }

  Future<List<Tweet>> getListTweets() => TwitterController().getListTweet(
        search,
      );

  @override
  void initState() {
    super.initState();

    listFutureTweets = getListTweets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).backgroundColor,
      body: _body(),
      appBar: _appBar(),
    );
  }

  PreferredSizeWidget _appBar() => AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: <Widget>[
            Icon(
              FlutterIcons.compass_ent,
              color: Colors.grey[800],
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              "News flow",
              style: TextStyle(color: Colors.grey[800]),
            )
          ],
        ),
      );

  Widget _body() => Stack(
        children: <Widget>[
          Align(
              alignment: Alignment.centerLeft,
              child: Image.asset("assets/images/twitter-logo.png")),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: InputSearchWidget(
                  onFieldSubmitted: submitForm,
                  focusNode: focusNode,
                  validator: (String value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Campo obrigatorio";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.done,
                  hintText: "Digite o nome do usuário",
                  submitForm: submitForm,
                  textEditingController: textEditingController,
                ),
              ),
              Expanded(
                  child: RefreshIndicator(
                onRefresh: () {
                  setState(() {});
                  return Future<void>.value();
                },
                child: FutureBuilder<List<Tweet>>(
                  future: TwitterController().getListTweet(
                    search,
                  ),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Tweet>> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return CenterIndicatorWidget();
                      case ConnectionState.active:
                      case ConnectionState.done:
                        if (snapshot.data == null || snapshot.data.isEmpty) {
                          return const MessageWidget();
                        }
                        return ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 4, top: 4),
                              child: ListTileTweetWidget(
                                  tweet: snapshot.data[index]),
                            );
                          },
                        );
                      default:
                        return const MessageWidget();
                    }
                  },
                ),
              )),
            ],
          ),
        ],
      );
}
