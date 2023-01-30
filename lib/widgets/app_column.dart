import 'package:flutter/material.dart';
import 'package:flutter_projects/controllers/popular_product_controller.dart';
import 'package:flutter_projects/widgets/small_text.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';
import '../utils/dimentions.dart';
import 'big_text.dart';
import 'icon_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;
  final int pageId;
  const AppColumn({super.key, this.text = "Nothing", this.pageId = 1});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text),
        SizedBox(height: Dimensions.height10),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              children: List.generate(
                  product.stars,
                  (index) =>
                      Icon(Icons.star, color: AppColors.mainColor, size: 15)),
            ),
            const SizedBox(width: 10),
            SmallText(text: product.stars.toString()),
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
