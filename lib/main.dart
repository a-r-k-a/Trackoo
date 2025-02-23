import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/controllers/auth_controller.dart';
import 'package:project1/modules/auth/views/auth_view.dart';

void main() {
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      home: AuthView(),
    );
  }
}
