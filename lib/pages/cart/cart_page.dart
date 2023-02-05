import 'package:flutter/material.dart';
import 'package:flutter_projects/utils/colors.dart';
import 'package:flutter_projects/utils/dimentions.dart';
import 'package:flutter_projects/widgets/app_icon.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.height20*3,
              left: Dimensions.width20,
              right:Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.arrow_back_ios,iconColor:Colors.white,background: AppColors.mainColor ,size: 24,),
                  AppIcon(icon: Icons.home_outlined,iconColor:Colors.white,background: AppColors.mainColor ,size: 24,),
                  AppIcon(icon: Icons.shopping_cart,iconColor:Colors.white,background: AppColors.mainColor ,size: 24,)
                ],
              ))
        ],
      ),
    );
  }
}
