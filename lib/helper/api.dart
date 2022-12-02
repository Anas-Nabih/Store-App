import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/helper/const.dart';

class Api {
  static Future<dynamic> get({String endPoint}) async {
    http.Response response =
        await http.get(Uri.parse("${Const.baseURL}$endPoint"));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          "there is a problem with status code${response.statusCode}");
    }
  }

  static Future<dynamic> post({@required endPoint, @required body}) async {
    http.Response response = await http
        .post(Uri.parse("${Const.baseURL}$endPoint"), body: body, headers: {
      "Accept": "application/json",
      // "Content-Type":"application/json",
    });
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          "there is a problem with status code ${response.statusCode} with body ${response.body}");
    }
  }

  static Future<dynamic> put({@required endPoint, @required body}) async {
    http.Response response = await http
        .put(Uri.parse("${Const.baseURL}$endPoint"), body: body, headers: {
      "Accept": "application/json",
      "Content-Type":"application/x-www-form-urlencoded",
    });
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          "there is a problem with status code ${response.statusCode} with body ${response.body}");
    }
  }
}
