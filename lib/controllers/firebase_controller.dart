import "dart:convert";

import "package:flutter/cupertino.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:http/http.dart" as http;

class FirebaseController {
  Future<dynamic> callTest(String message) {
    return http.post("${DotEnv().env["END_POINT_API_FIREBASE"]}/call-test",
        body: <String, String>{
          "message": message,
        }).then((dynamic value) {
      return json.encode(value.body);
    }).catchError((dynamic err) {
      debugPrint(err.toString());
    });
  }
}
