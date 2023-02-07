import 'package:flutter/material.dart';
import 'package:flutter_projects/controllers/popular_product_controller.dart';
import 'package:flutter_projects/pages/cart/cart_page.dart';
import 'package:flutter_projects/pages/food/popular_food_details.dart';
import 'package:flutter_projects/pages/food/recommended_food_detail.dart';
import 'package:flutter_projects/pages/home/food_page_body.dart';
import 'package:flutter_projects/pages/home/main_food_page.dart';
import 'package:flutter_projects/route/route_helper.dart';
import 'package:get/get.dart';
import 'controllers/recommended_product_controller.dart';
import 'helper/dependencies.dart' as dep;

// void main() async => {
//       WidgetsFlutterBinding
//           .ensureInitialized(), // it make sure that dependencise are loaded correctly
//       Get.find<PopularProductController>().getPopularProductList(),
//       await dep.init(),
//       runApp(const GetMaterialApp(
//           debugShowCheckedModeBanner: false,
//           home:
//               RecommendedFoodDetail() // PopularFoodDetail(), //MainFoodPage(),
//           ))
//     };

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<RecommendedProductController>().getRecommendedProductList();
    Get.find<PopularProductController>().getPopularProductList();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainFoodPage(), //RecommendedFoodDetail(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}
