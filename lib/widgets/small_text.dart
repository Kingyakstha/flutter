import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  TextOverflow overflow;
  Color color;
  final String text;
  double size;
  double height;
  SmallText(
      {super.key,
      this.color = const Color(0xFFccc7c5),
      required this.text,
      this.size = 12,
      this.height = 1.2,
      this.overflow = TextOverflow.visible});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        height: height,
        overflow: overflow,
        //fontFamily: 'Roboto',
      ),
    );
  }
}
