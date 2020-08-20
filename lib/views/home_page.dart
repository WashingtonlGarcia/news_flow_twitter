import 'dart:convert';

import 'package:cloud_functions/cloud_functions.dart';
import "package:flutter/material.dart";
import "package:news_flow/controllers/twitter_controller.dart";
import "package:http/http.dart" as http;
import "dart:async";

class HomePage extends StatelessWidget {
  static const String routeName = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          http.post("endpoint", body: {
            "message":
                "Real-time #oilprice news & analysis on #oilmarkets from S&P Global Platts. Covers global #crudeoil, refined oil, #jetfuel & gasoil. RTs don’t equal endorsements",
          })
              /*   CloudFunctions.instance.getHttpsCallable(functionName: "function-2").call()*/ .then((value) {
            var res = json.encode(value.body);
            print("res= " + res);
          }).catchError((err) {
            print(err);
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
