
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newproject/model/home_page_model.dart';
class HomePageApi{
  
  static Future<List?> fetchHomeData() async{
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    print("$response" + 'this is our home page status code ');
    print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
    print(response.body);

    if(response.statusCode == 200){
      return homePageModelFromJson(response.body);
    }else{
      return null;
    }
  }
}