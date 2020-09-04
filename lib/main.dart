import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:flutter_localizations/flutter_localizations.dart";

import "routes.dart";
import "views/home_page.dart";

dynamic main() async {
  await DotEnv().load();

  runApp(MaterialApp(
    localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      DefaultCupertinoLocalizations.delegate
    ],
    supportedLocales: const <Locale>[Locale("pt", "BR")],
    theme: ThemeData(
      primaryColor: const Color(0xff6DC2F6),
      primaryColorDark: const Color(0xff2E6C9C),
      accentColor: const Color(0xffD06F7C),
      backgroundColor: const Color(0xffEFF2F7),
    ),
    darkTheme: ThemeData(
      primaryColor: const Color(0xff2E6C9C),
      primaryColorDark: const Color(0xff213548),
      accentColor: const Color(0xffDA8E2E),
      backgroundColor: const Color(0xff111111),
    ),
    initialRoute: HomePage.routeName,
    routes: Routes.routes,
  ));
}
