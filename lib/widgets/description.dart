import 'dart:ui';
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class FoodDescription extends StatelessWidget {
  Color color;
  final String text;
  double size;
  TextOverflow overflow;
  FoodDescription({
    super.key,
    this.color = const Color(0xFF332d2b),
    required this.text,
    this.size = 20,
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
