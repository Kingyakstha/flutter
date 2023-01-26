import 'package:flutter/material.dart';
import 'package:flutter_projects/widgets/small_text.dart';

import '../utils/colors.dart';
import '../utils/dimentions.dart';
import 'big_text.dart';
import 'icon_text_widget.dart';

class AppColumn extends StatelessWidget {
  const AppColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: "American Stake"),
        SizedBox(height: Dimensions.height10),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              children: List.generate(
                  5,
                  (index) =>
                      Icon(Icons.star, color: AppColors.mainColor, size: 15)),
            ),
            const SizedBox(width: 10),
            SmallText(text: "4.5"),
            const SizedBox(width: 10),
            SmallText(text: "1666"),
            const SizedBox(width: 10),
            SmallText(text: "comments"),
          ],
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
                icon: Icons.circle_sharp,
                text: "Normal",
                iconColor: AppColors.iconColor1),
            IconAndTextWidget(
                icon: Icons.location_on,
                text: "1.7m",
                iconColor: AppColors.mainColor),
            IconAndTextWidget(
                icon: Icons.access_time_rounded,
                text: "32min",
                iconColor: AppColors.iconColor2),
          ],
        ),

        //SmallText(text: "Stake is one of the findes")
      ],
    );
  }
}
