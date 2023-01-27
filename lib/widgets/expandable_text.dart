import 'package:flutter/material.dart';
import 'package:flutter_projects/utils/colors.dart';
import 'package:flutter_projects/utils/dimentions.dart';
import 'package:flutter_projects/widgets/small_text.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({super.key, required this.text});

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firsthalf;
  late String secondhalf;

  String textt = "Show more";
  IconData icon = Icons.arrow_drop_down;

  bool hiddenText = true;
  double textHeight = Dimensions.height200;
  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firsthalf = widget.text.substring(0, textHeight.toInt());
      secondhalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firsthalf = widget.text;
      secondhalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondhalf.isEmpty
          ? SmallText(
              text: firsthalf,
              size: 15,
              color: AppColors.paraColor,
            )
          : Column(
              children: [
                SmallText(
                  text:
                      hiddenText ? ("$firsthalf...") : (firsthalf + secondhalf),
                  size: 15,
                  color: AppColors.paraColor,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                      if (hiddenText == true) {
                        textt = "Show more";
                        icon = Icons.arrow_drop_down;
                      } else {
                        textt = "Show less";
                        icon = Icons.arrow_drop_up;
                      }
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(
                        text: textt,
                        // text: "Show more",
                        size: 15,
                        color: AppColors.mainColor,
                      ),
                      Icon(
                        // Icons.arrow_drop_down,
                        icon,
                        color: AppColors.mainColor,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
