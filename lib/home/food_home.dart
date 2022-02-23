import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_dee/home/food_type_page.dart';
import 'package:food_dee/utils/color_constants.dart';
import 'package:food_dee/utils/dimens.dart';
import 'package:food_dee/widgets/big_text.dart';
import 'package:food_dee/widgets/small_text.dart';

class FoodHome extends StatefulWidget {
  const FoodHome({Key? key}) : super(key: key);

  @override
  _FoodHomeState createState() => _FoodHomeState();
}

class _FoodHomeState extends State<FoodHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40),
            padding: EdgeInsets.only(left: Dimens.w_margin20, right: Dimens.w_margin20, bottom: Dimens.margin10),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: 'Country',
                      ),
                      SmallText(text: 'city')
                    ],
                  ),
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: ColorContants.color_icon),
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 20,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: FoodTypePage(),
          )),
        ],
      ),
    );
  }
}
