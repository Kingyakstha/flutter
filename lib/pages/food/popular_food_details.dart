import 'package:flutter/material.dart';
import 'package:flutter_projects/utils/colors.dart';
import 'package:flutter_projects/utils/dimentions.dart';
import 'package:flutter_projects/widgets/app_column.dart';
import 'package:flutter_projects/widgets/app_icon.dart';
import 'package:flutter_projects/widgets/expandable_text.dart';
import '../../widgets/big_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //background image
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 400,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/meat.jpg")),
                ),
              )),
          //icons widget
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const AppIcon(icon: Icons.arrow_back_ios),
                  const AppIcon(icon: Icons.shopping_cart_checkout_outlined)
                ],
              )),
          //description part
          //intro
          Positioned(
              top: 380,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                  padding: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      top: Dimensions.height20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppColumn(),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        BigText(text: "Introduction"),
                        SizedBox(
                          height: Dimensions.height30,
                        ),
                        //to make it scrollable SingleChildScrollView was used but it should be used with expanded widget
                        const Expanded(
                          child: SingleChildScrollView(
                            child: ExpandableText(
                                text:
                                    "Bloom proposed the technique for applications where the amount of source data would require an impractically large amount of memory if error-free hashing techniques were applied. He gave the example of a hyphenation algorithm for a dictionary of 500,000 words, out of which 90% follow simple hyphenation rules, but the remaining 10% require expensive disk accesses to retrieve specific hyphenation patterns. With sufficient core memory, an error-free hash could be used to eliminate all unnecessary disk accesses; on the other hand, with limited core memory, Bloom's technique uses a smaller hash area but still eliminates most unnecessary accesses. For example, a hash area only 15% of the size needed by an ideal error-free hash still eliminates 85% of the disk accesses."),
                          ),
                        ),
                      ]))),
          //expandable text
          //ExpandableText(text: "hola"),
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.height120,
        padding: EdgeInsets.only(
            left: Dimensions.width20,
            right: Dimensions.width20,
            top: Dimensions.height30,
            bottom: Dimensions.height30),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          color: Colors.black12,
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            padding: EdgeInsets.only(
              top: Dimensions.height20,
              bottom: Dimensions.height20,
              right: Dimensions.width20,
              left: Dimensions.width20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.remove,
                  color: AppColors.signColor,
                ),
                SizedBox(
                  width: Dimensions.width5,
                ),
                BigText(text: "0"),
                SizedBox(
                  width: Dimensions.width5,
                ),
                Icon(
                  Icons.add,
                  color: AppColors.signColor,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: Dimensions.height20,
              bottom: Dimensions.height20,
              right: Dimensions.width20,
              left: Dimensions.width20,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.mainColor),
            child: BigText(text: "\$0.08 Add to cart"),
          ),
        ]),
      ),
    );
  }
}
