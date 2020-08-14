import "package:flutter/material.dart";

class HomePage extends StatelessWidget {
  static const String routeName = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  PreferredSizeWidget _appBar() => AppBar(
        title: const Text(""),
      );

  Widget _body() => Container();
}
