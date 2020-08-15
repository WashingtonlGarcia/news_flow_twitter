import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:flutter_localizations/flutter_localizations.dart";

import "routes.dart";
import "views/home_page.dart";

dynamic main() async {
  await DotEnv().load();
  // initializeDateFormatting("pt_br", null);
  runApp(MaterialApp(
    localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      DefaultCupertinoLocalizations.delegate
    ],
    supportedLocales: const <Locale>[Locale("pt", "BR")],
    initialRoute: HomePage.routeName,
    routes: Routes.routes,
  ));
}
