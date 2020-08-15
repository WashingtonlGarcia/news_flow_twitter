import "package:flutter/material.dart";
import "package:news_flow/controllers/twitter_controller.dart";

class HomePage extends StatelessWidget {
  static const String routeName = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          TwitterController().getListTweet("@divinobfilho").then((dynamic value) {
            debugPrint(value[3].dateFormat.toString());
          });
        },
      ),
    );
  }

  PreferredSizeWidget _appBar() => AppBar(
        title: const Text(""),
      );

  Widget _body() => Container();
}
