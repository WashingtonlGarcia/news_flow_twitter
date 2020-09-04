import "package:dio/dio.dart";

import "package:flutter_dotenv/flutter_dotenv.dart";

class FirebaseService {
  Future<dynamic> callClassification(String message) {
    return Dio().post("${DotEnv().env["END_POINT_API_FIREBASE"]}/call-test", data: <String, String>{
      "message": message,
    }).then((Response<dynamic> value) {
      return value.data.toString();
    }).catchError((dynamic err) {
      throw err;
    });
  }
}
