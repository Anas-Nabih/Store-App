import 'dart:convert';

import 'package:http/http.dart' as http;

class Categories{


  Future<List<dynamic>> getAllCategories()async{
    http.Response response =await http.get(Uri.parse("https://fakestoreapi.com/products/categories"));

    var data = jsonDecode(response.body);

    return data;
  }
}