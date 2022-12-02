import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store_app/helper/const.dart';

class Api {

 static Future<dynamic> get({String endPoint}) async {
    http.Response response = await http.get(Uri.parse("${Const.baseURL}$endPoint"));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          "there is a problem with status code${response.statusCode}");
    }
  }
}
