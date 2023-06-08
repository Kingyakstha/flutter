import 'package:flutter/material.dart';
import 'package:flutter_projects/pages/home/food_page_body.dart';
import 'package:flutter_projects/utils/colors.dart';
import 'package:flutter_projects/utils/dimentions.dart';
import 'package:flutter_projects/widgets/big_text.dart';
import 'package:flutter_projects/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    // print("current height is " + MediaQuery.of(context).size.width.toString());
    return Scaffold(
        body: Column(children: [
      Container(
        child: Container(
            margin: const EdgeInsets.only(top: 45, bottom: 15),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: "Nepal",
                        color: AppColors.mainColor,
                      ),
                      SizedBox(height: Dimensions.height5),
                      Row(children: [
                        SmallText(
                          text: "Chitwan n",
                          color: Colors.black54,
                        ),
                        const Icon(Icons.arrow_drop_down)
                      ])
                    ],
                  ),
                  Container(
                    width: 45,
                    height: Dimensions.height45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.mainColor,
                    ),
                    child: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  )
                ])),
      ),
      Expanded(child: SingleChildScrollView(child: FoodPageBody())),
      // FoodPageBody(),
    ]));
  }
}
