import 'package:flutter/cupertino.dart';
import 'package:food_dee/utils/color_constants.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  double height;

  SmallText(
      {Key? key,
      required this.text,
      this.color = ColorContants.color_small_text,
      this.size = 12,
      this.height = 1.2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.actor(
          fontSize: size,
          color: color,
          fontWeight: FontWeight.w400,
          height: height),
    );
  }
}
