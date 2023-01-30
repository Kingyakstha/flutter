import 'package:flutter/material.dart';
import 'package:flutter_projects/pages/food/popular_food_details.dart';
import 'package:flutter_projects/pages/food/recommended_food_detail.dart';
import 'package:flutter_projects/pages/home/main_food_page.dart';
import 'package:get/get.dart';

//the mistake I made here was to use pageID inplace of pageId , fuck that was one hell of a mistake
class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular_food";
  static const String recommendedFood = "/recommended_food";

  static String getInital() => '$initial';
  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static String getRecommendedFood(int pageId) =>
      '$recommendedFood?pageId=$pageId';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainFoodPage()),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return PopularFoodDetail(pageId: int.parse(pageId!));
        }),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return RecommendedFoodDetail(pageId: int.parse(pageId!));
        }),
  ];
}
