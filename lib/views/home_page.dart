import "package:flutter/material.dart";
import "package:news_flow/controllers/firebase_controller.dart";

class HomePage extends StatelessWidget {
  static const String routeName = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseController().callTest("test").then((dynamic value) {
            debugPrint(value.toString());
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
