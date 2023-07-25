import 'package:flutter/material.dart';
import 'package:sky_status/welcome_screen/welcome.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void clearAppHash() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('appHash');
}
Future<void> clearAppStorage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
  print('App storage cleared');
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Welcome Screen',
      home: WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
