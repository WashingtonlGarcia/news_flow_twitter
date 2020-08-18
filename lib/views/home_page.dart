import "package:flutter/material.dart";

import "package:news_flow/controllers/twitter_controller.dart";
import "package:news_flow/models/tweet.dart";

import "package:news_flow/widgets/input_search_widget.dart";

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

/*
  Stream<List<Tweet>> getFutureListTweets() {
    return
  }
*/

  @override
  void initState() {
    super.initState();
/*    Provider.of<SearchProvider>(context).addListener(() {
      listFutureTweets = getFutureListTweets();
    });*/
  }

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

  Widget _body() => Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: InputSearchWidget(
              onFieldSubmitted: submitForm,
              focusNode: focusNode,
              validator: (String value) {
                if (value == null || value.isEmpty) return "Campo obrigatorio";
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
              child: StreamBuilder<List<Tweet>>(
            stream: TwitterController()
                .getListTweet(
                  search ?? "",
                )
                .asStream(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Tweet>> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Container();
                case ConnectionState.done:

                case ConnectionState.active:
                  if (snapshot.data == null || snapshot.data.isEmpty) {
                    return const Text("Vazio");
                  }
                  return Text(snapshot.data.length.toString());
                default:
                  return Container();
              }
            },
          )),
        ],
      );
}
