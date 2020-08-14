import "package:flutter/material.dart";

import "package:flutter_dotenv/flutter_dotenv.dart";

import "routes.dart";
import "views/home_page.dart";

dynamic main() async {
  await DotEnv().load();
  runApp(MaterialApp(
    initialRoute: HomePage.routeName,
    routes: Routes.routes,
  ));
}
