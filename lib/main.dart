import 'package:flutter/material.dart';
import 'package:food_dee/home/food_home.dart';
import 'package:food_dee/utils/color_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoodDeezz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: ColorContants.background_color
      ),
      home: const FoodHome(),
    );
  }
}
