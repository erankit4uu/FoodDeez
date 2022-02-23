import 'package:get/get.dart';

class Dimens{
 static double height = Get.height;
 static double width = Get.width;

 // calculate the screen size for pageViewContraller;
 /*Example the height of the screen is 844 and the page controller height is 220
 * the 844/220 = 3.84*/

  static double pageViewControllerHeight = height/3.84;
  static double pageViewControllerTextHeight = height/7.03; // 844/120 = 7.03
  static double pageContainerHeight = height/2.63;


  static double height120 = height/7.03;
  static double width120 = height/7.03;
  static double height80 = height/10.5;


  //margins
 static double margin5 = height/168.8;
 static double margin10 = height/84.4;
 static double margin20 = height/42.2;
 static double margin30 = height/28.2;

 //width margin
 static double w_margin5 = width/168.8;
 static double w_margin10 = width/84.4;
 static double w_margin15 = width/110.4;
 static double w_margin20 = width/42.2;
 static double w_margin30 = width/28.2;

}