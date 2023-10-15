import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:newproject/pages/homepage.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  void loginApi() async {
    try {
      final response = await http.post(
        Uri.parse('https://staging.pieinfosystems.com/prpty/login'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "userName": emailController.value.text,
          "password": passwordController.value.text,
        }),
      );

      var data = jsonDecode(response.body);
      print("!!!!!!!!!!!!!!!!!  __ this is my below data ***");
      print(data);
      if (data['token'] != null) {
        Get.to(HomePage());
      }

      if (response.statusCode == 200) {
        Get.snackbar('SuccessFull', "Login Completed"
          ,icon: Icon(Icons.pan_tool_sharp,color: Colors.white,),backgroundColor: Colors.green);
      } else {
        Get.snackbar('Loing Failed', 'Check again',icon: Icon(Icons.error,color: Colors.white,),backgroundColor: Colors.red);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
