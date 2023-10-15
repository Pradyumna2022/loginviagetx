import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newproject/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      theme: ThemeData.dark(useMaterial3: true),
      home: LoginScreen(),
    );
  }
}
