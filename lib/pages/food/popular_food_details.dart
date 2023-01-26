import 'package:flutter/material.dart';
import 'package:flutter_projects/utils/dimentions.dart';
import 'package:flutter_projects/widgets/app_column.dart';
import 'package:flutter_projects/widgets/app_icon.dart';
import '../../widgets/big_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
                      ]))),
        ],
      ),
    );
  }
}
