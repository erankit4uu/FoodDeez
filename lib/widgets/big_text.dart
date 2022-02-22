import 'package:flutter/cupertino.dart';
import 'package:food_dee/utils/color_constants.dart';
import 'package:google_fonts/google_fonts.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow textOverflow;

  BigText(
      {Key? key,
      required this.text,
      this.color = ColorContants.color_big_text,
      this.textOverflow = TextOverflow.ellipsis,
      this.size = 16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: textOverflow,
      style: GoogleFonts.actor(fontSize: size, color: color, fontWeight: FontWeight.w400),
    );
  }
}
