import 'package:flutter/material.dart';
import 'package:flutter_projects/controllers/cart_controller.dart';
import 'package:flutter_projects/pages/home/main_food_page.dart';
import 'package:flutter_projects/route/route_helper.dart';
import 'package:flutter_projects/utils/app_constants.dart';
import 'package:flutter_projects/utils/colors.dart';
import 'package:flutter_projects/utils/dimentions.dart';
import 'package:flutter_projects/widgets/app_column.dart';
import 'package:flutter_projects/widgets/app_icon.dart';
import 'package:flutter_projects/widgets/expandable_text.dart';
import '../../controllers/popular_product_controller.dart';
import '../../widgets/big_text.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class PopularFoodDetail extends StatelessWidget {
  int pageId;
  PopularFoodDetail({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(Get.find<CartController>());
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
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            AppConstants.BASE_URL + "/uploads/" + product.img)),
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
                    GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteHelper.getInital());
                        },
                        child: const AppIcon(icon: Icons.arrow_back_ios)),
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
                          AppColumn(
                            text: product.name,
                            pageId: pageId,
                          ),
                          SizedBox(
                            height: Dimensions.height20,
                          ),
                          BigText(text: "Introduction"),
                          SizedBox(
                            height: Dimensions.height30,
                          ),
                          //to make it scrollable SingleChildScrollView was used but it should be used with expanded widget
                          Expanded(
                            child: SingleChildScrollView(
                              child: ExpandableText(text: product.description!),
                            ),
                          ),
                        ]))),
            //expandable text
            //ExpandableText(text: "hola"),
          ],
        ),
        bottomNavigationBar: GetBuilder<PopularProductController>(
          builder: (popularProduct) {
            return Container(
              height: Dimensions.height120,
              padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  top: Dimensions.height30,
                  bottom: Dimensions.height30),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                color: Colors.black12,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                          GestureDetector(
                            onTap: () {
                              popularProduct.setQuantity(false);
                            },
                            child: Icon(
                              Icons.remove,
                              color: AppColors.signColor,
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.width5,
                          ),
                          BigText(text: popularProduct.quantity.toString()),
                          SizedBox(
                            width: Dimensions.width5,
                          ),
                          GestureDetector(
                            onTap: () {
                              popularProduct.setQuantity(true);
                            },
                            child: Icon(
                              Icons.add,
                              color: AppColors.signColor,
                            ),
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
                      child: GestureDetector(
                          onTap: () {
                            popularProduct.addItem(product);
                          },
                          child:
                              BigText(text: "\$${product.price} Add to cart")),
                    ),
                  ]),
            );
          },
        ));
  }
}
