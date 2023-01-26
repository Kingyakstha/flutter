import 'package:flutter/material.dart';
import 'package:flutter_projects/pages/food/popular_food_details.dart';
import 'package:flutter_projects/pages/home/main_food_page.dart';
import 'package:get/get.dart';

void main() => runApp(const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: PopularFoodDetail(), //MainFoodPage(),
    ));
