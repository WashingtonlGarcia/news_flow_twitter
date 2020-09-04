import "package:flutter/material.dart";

import "views/home_page.dart";

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = <String, Widget Function(BuildContext)>{
    HomePage.routeName: (BuildContext context) => HomePage(),
  };
}
