import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_dee/widgets/big_text.dart';
import 'package:food_dee/widgets/icon_text_widget.dart';
import 'package:food_dee/widgets/small_text.dart';

import '../utils/color_constants.dart';
import '../utils/dimens.dart';

class FoodTypePage extends StatefulWidget {
  FoodTypePage({Key? key}) : super(key: key);

  @override
  _FoodTypePageState createState() => _FoodTypePageState();
}

class _FoodTypePageState extends State<FoodTypePage> {
  PageController _pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _cardHeight = Dimens.pageViewControllerHeight;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPageValue = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Dimens.pageContainerHeight,
          margin: EdgeInsets.only(top: Dimens.margin20),
          child: PageView.builder(
              controller: _pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return Container(
                  child: _foodTypeItem(position),
                );
              }),
        ),
        DotsIndicator(
          dotsCount: 5,
          position: _currentPageValue,
          decorator: DotsDecorator(
            color: ColorContants.color_icon,
            // Inactive color
            activeColor: ColorContants.color_icon2,
            size: Size.square(9.0),
            activeSize: Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        SizedBox(
          height: Dimens.margin30,
        ),
        _popularWidget(),
        //List builder for popular cuisine
        Container(
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                        left: Dimens.margin20, bottom: Dimens.margin10),
                    child: Row(
                      children: [
                        Container(
                          height: Dimens.height120,
                          width: Dimens.width120,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimens.margin30),
                              color: index.isEven
                                  ? ColorContants.color_icon
                                  : Colors.blue,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    "assets/images/dosa_platter.jpg"),
                              )),
                        ),
                        //text for popular
                        Container(
                          height: Dimens.height80,
                          padding: EdgeInsets.only(right: Dimens.w_margin10,),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(Dimens.w_margin20),
                                  bottomRight:
                                      Radius.circular(Dimens.w_margin20),
                              ),
                          color: Colors.white),
                          child: Container(
                            height: Dimens.pageViewControllerTextHeight,
                            margin: EdgeInsets.only(
                                left: Dimens.w_margin30,
                                right: Dimens.w_margin30,
                                bottom: Dimens.margin5),
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: Dimens.w_margin15,
                                  right: Dimens.w_margin15,
                                  top: Dimens.margin5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BigText(text: "South Indian Platter"),
                                  SizedBox(
                                    height: Dimens.margin5,
                                  ),
                                  Row(
                                    children: [
                                      Wrap(
                                        children: List.generate(
                                            5,
                                                (index) => Icon(
                                              Icons.star,
                                              color: ColorContants.color_icon2,
                                              size: Dimens.margin10,
                                            )),
                                      ),
                                      SizedBox(
                                        width: Dimens.margin10,
                                      ),
                                      SmallText(
                                        text: "4.5",
                                      ),
                                      SizedBox(
                                        width: Dimens.margin10,
                                      ),
                                      SmallText(
                                        text: "1234",
                                      ),
                                      SizedBox(
                                        width: Dimens.margin10,
                                      ),
                                      SmallText(
                                        text: "comments",
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: Dimens.margin5,
                                  ),
                                  Row(
                                    children: [
                                      IconTextWidget(
                                        icon: Icons.circle,
                                        text: "Normal",
                                        iconColor: ColorContants.color_icon,
                                      ),
                                      SizedBox(
                                        width: Dimens.margin10,
                                      ),
                                      IconTextWidget(
                                        icon: Icons.location_pin,
                                        text: "17.5 km",
                                        iconColor: ColorContants.color_icon,
                                      ),
                                      SizedBox(
                                        width: Dimens.margin10,
                                      ),
                                      IconTextWidget(
                                        icon: Icons.history_toggle_off,
                                        text: "32 min",
                                        iconColor: Colors.redAccent,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                })),
      ],
    );
  }

  Widget _popularWidget() {
    return Container(
      margin: EdgeInsets.only(left: Dimens.w_margin20),
      child: Row(
        children: [
          BigText(text: "Popular cuisine"),
          SizedBox(
            width: Dimens.w_margin15,
          ),
          SmallText(text: 'Food pairing')
        ],
      ),
    );
  }

  Widget _foodTypeItem(int index) {
    Matrix4 matrix4 = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _cardHeight * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _cardHeight * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(1, currTrans, 1);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _cardHeight * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(1, currTrans, 1);
    } else {
      var currScale = 0.8;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _cardHeight * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
        transform: matrix4,
        child: Stack(
          children: [
            Container(
              height: Dimens.pageViewControllerHeight,
              margin: EdgeInsets.only(left: 5, right: 5, top: Dimens.margin10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: index.isEven ? ColorContants.color_icon : Colors.blue,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/dosa_platter.jpg"),
                  )),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: Dimens.pageViewControllerTextHeight,
                  margin: EdgeInsets.only(
                      left: Dimens.w_margin30,
                      right: Dimens.w_margin30,
                      bottom: Dimens.margin10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimens.margin20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 5.0,
                            offset: Offset(0, 5))
                      ]),
                  child: Container(
                    padding: EdgeInsets.only(
                        left: Dimens.w_margin15,
                        right: Dimens.w_margin15,
                        top: Dimens.margin10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(text: "South Indian Platter"),
                        SizedBox(
                          height: Dimens.margin10,
                        ),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(
                                  5,
                                  (index) => Icon(
                                        Icons.star,
                                        color: ColorContants.color_icon2,
                                        size: Dimens.margin10,
                                      )),
                            ),
                            SizedBox(
                              width: Dimens.margin10,
                            ),
                            SmallText(
                              text: "4.5",
                            ),
                            SizedBox(
                              width: Dimens.margin10,
                            ),
                            SmallText(
                              text: "1234",
                            ),
                            SizedBox(
                              width: Dimens.margin10,
                            ),
                            SmallText(
                              text: "comments",
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Dimens.margin20,
                        ),
                        Row(
                          children: [
                            IconTextWidget(
                              icon: Icons.circle,
                              text: "Normal",
                              iconColor: ColorContants.color_icon,
                            ),
                            SizedBox(
                              width: Dimens.margin10,
                            ),
                            IconTextWidget(
                              icon: Icons.location_pin,
                              text: "17.5 km",
                              iconColor: ColorContants.color_icon,
                            ),
                            SizedBox(
                              width: Dimens.margin10,
                            ),
                            IconTextWidget(
                              icon: Icons.history_toggle_off,
                              text: "32 min",
                              iconColor: Colors.redAccent,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ));
  }
}
