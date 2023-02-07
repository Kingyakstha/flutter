import 'package:flutter/material.dart';
import 'package:flutter_projects/controllers/cart_controller.dart';
import 'package:flutter_projects/pages/home/main_food_page.dart';
import 'package:flutter_projects/utils/colors.dart';
import 'package:flutter_projects/utils/dimentions.dart';
import 'package:flutter_projects/widgets/app_icon.dart';
import 'package:flutter_projects/widgets/big_text.dart';
import 'package:flutter_projects/widgets/small_text.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: Dimensions.height20 * 3,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                    icon: Icons.arrow_back_ios,
                    iconColor: Colors.white,
                    background: AppColors.mainColor,
                    size: 30,
                  ),
                  SizedBox(
                    width: Dimensions.width20 * 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => MainFoodPage());
                    },
                    child: AppIcon(
                      icon: Icons.home_outlined,
                      iconColor: Colors.white,
                      background: AppColors.mainColor,
                      size: 30,
                    ),
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart,
                    iconColor: Colors.white,
                    background: AppColors.mainColor,
                    size: 30,
                  )
                ],
              )),
          Positioned(
              top: Dimensions.height10 * 10,
              left: Dimensions.width20,
              right: Dimensions.width20,
              bottom: 0,
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.height20),
                //color: Colors.red,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GetBuilder<CartController>(
                    builder: (cartcontroller) {
                      return ListView.builder(
                          itemCount: 10, //cartcontroller.getItems.length,
                          itemBuilder: (_, index) {
                            return Container(
                              height: 120,
                              width: double.maxFinite,
                              // color: Colors.blue,
                              margin: EdgeInsets.only(bottom: 10),
                              child: Row(children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      bottom: Dimensions.height10),
                                  width: Dimensions.width10 * 12,
                                  height: Dimensions.height10 * 12,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            "assets/images/meat.jpg")),
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.amber,
                                  ),
                                ),
                                SizedBox(
                                  width: Dimensions.width10,
                                ),
                                Expanded(
                                    child: Container(
                                  height: Dimensions.height120,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      BigText(text: "Bitter Orange"),
                                      //  cartcontroller
                                      //     .getItems[index].name!),
                                      SmallText(text: "Spicy"),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          BigText(text: "\$ 33.0"
                                              // cartcontroller
                                              //     .getItems[index].price
                                              //     .toString(),
                                              // color: Colors.red,
                                              ),
                                          Container(
                                            padding: EdgeInsets.only(
                                              top: Dimensions.height10,
                                              bottom: Dimensions.height10,
                                              right: Dimensions.width10,
                                              left: Dimensions.width10,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.white,
                                            ),
                                            child: Row(
                                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    // popularProduct.setQuantity(false);
                                                  },
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: AppColors.signColor,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: Dimensions.width5,
                                                ),
                                                BigText(
                                                    text:
                                                        "0"), // popularProduct.cartItems.toString()),
                                                SizedBox(
                                                  width: Dimensions.width5,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    //popularProduct.setQuantity(true);
                                                  },
                                                  child: Icon(
                                                    Icons.add,
                                                    color: AppColors.signColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ))
                              ]),
                            );
                          });
                    },
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
