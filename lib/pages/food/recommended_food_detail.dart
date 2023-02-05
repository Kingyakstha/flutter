import 'package:flutter/material.dart';
import 'package:flutter_projects/controllers/popular_product_controller.dart';
import 'package:flutter_projects/controllers/recommended_product_controller.dart';
import 'package:flutter_projects/route/route_helper.dart';
import 'package:flutter_projects/utils/colors.dart';
import 'package:flutter_projects/utils/dimentions.dart';
import 'package:flutter_projects/widgets/app_icon.dart';
import 'package:flutter_projects/widgets/expandable_text.dart';
import 'package:get/get.dart';
import '../../controllers/cart_controller.dart';
import '../../utils/app_constants.dart';
import '../../widgets/big_text.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;
  const RecommendedFoodDetail({super.key, this.pageId = 1});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product,Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getInital());
                      },
                      child: AppIcon(icon: Icons.clear)),
                  //AppIcon(icon: Icons.shopping_cart_outlined)
                  GetBuilder<PopularProductController>(builder:(controller){
                    return Stack(
                      children: [
                        const AppIcon(icon: Icons.shopping_cart_checkout_outlined),
                        Get.find<PopularProductController>().totalItems>=1?
                        Positioned(
                            right:3,top:3,
                            child: BigText(text: Get.find<PopularProductController>().totalItems.toString(),size: 12,color: Colors.white,)):
                        Container()
                      ],
                    );
                  })
                ]),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(
                    top: Dimensions.height5, bottom: Dimensions.height10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: Center(child: BigText(text: product.name, size: 26)),
              ),
            ),
            backgroundColor: AppColors.yellowColor,
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              //     background: Image.asset(
              //   "assets/images/meat.jpg",
              //   width: double.maxFinite,
              //   fit: BoxFit.cover,
              // )
              background: Image.network(
                  AppConstants.BASE_URL + "/uploads/" + product.img),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      bottom: Dimensions.height10),
                  child: ExpandableText(text: product.description),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar:GetBuilder<PopularProductController>(builder: (controller){
       return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width10 * 5,
                  right: Dimensions.width10 * 5,
                  top: Dimensions.height10,
                  bottom: Dimensions.height10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap:(){
                      controller.setQuantity(false);
                    },
                    child: AppIcon(
                      icon: Icons.remove,
                      background: AppColors.mainColor,
                      iconColor: Colors.white,
                    ),
                  ),

                  BigText(
                    text: "\$${product.price} X ${controller.cartItems}",
                    color: AppColors.mainBlackColor,
                    size: 26,
                  ),
                  GestureDetector(
                    onTap:(){
controller.setQuantity(true);
                    },
                    child:  AppIcon(
                      icon: Icons.add,
                      background: AppColors.mainColor,
                      iconColor: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Container(
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
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.mainColor,
                        size: 30,
                      ),
                    ),
                    GestureDetector(
                      onTap:(){
                        controller.addItem(product);
                      } ,
                      child:
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
                        child: BigText(text: "\$ ${product.price!} | Add to cart"),
                      ),
                    )
                  ]),
            ),
          ],
        );
      },)
    );
  }
}
