import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/color_constants.dart';

class IconTextWidget extends StatelessWidget {
  final Color? textColor;
  final Color? iconColor;
  final String text;
  double size;
  double iconSize;
  double height;
  IconData icon;

  IconTextWidget(
      {Key? key,
      required this.icon,
      required this.text,
      this.textColor = ColorContants.color_small_text,
      this.iconColor = ColorContants.color_icon,
      this.size = 12,
      this.iconSize = 16,
      this.height = 1.2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Icon(
        icon,
        color: iconColor,
        size: size,
      ),
      SizedBox(
        width: 10,
      ),
      Text(
        text,
        style: GoogleFonts.roboto(
            fontSize: size,
            color: textColor,
            fontWeight: FontWeight.w400,
            height: height),
      ),
    ]);
  }
}
