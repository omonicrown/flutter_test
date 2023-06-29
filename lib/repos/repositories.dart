import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_test/Models/user_model.dart';

import 'package:http/http.dart';

class UserRepository{
  String endpoint = ' https://fakestoreapi.com/products';
  Future<List<UserModel>> getUser()async{
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => UserModel.fromJson(e)).toList();
    }  else{
      print(response.reasonPhrase);
      throw Exception(response.reasonPhrase);
    }
  }
}