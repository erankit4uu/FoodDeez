import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_dee/utils/color_constants.dart';

class FoodTypePage extends StatefulWidget {
  const FoodTypePage({Key? key}) : super(key: key);

  @override
  _FoodTypePageState createState() => _FoodTypePageState();
}

class _FoodTypePageState extends State<FoodTypePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      margin: const EdgeInsets.only(top: 20),
      child: PageView.builder(
          itemCount: 5,
          itemBuilder: (context, position) {
            return Container(
              child: _foodTypeItem(position),
            );
          }),
    );
  }

  Widget _foodTypeItem(int index) {
    return Container(
      height: 220,
      margin: const EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: index.isEven
              ? ColorContants.color_icon2
              : Colors.blue,
      image: const DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage("assets/images/dosa_platter.jpg"),
      )),
    );
  }
}
