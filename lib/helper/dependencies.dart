import 'package:flutter_projects/controllers/popular_product_controller.dart';
import 'package:flutter_projects/data/repository/popular_product_repo.dart';
import 'package:flutter_projects/utils/app_constants.dart';
import 'package:get/get.dart';
import '../data/api/api_client.dart';

Future<void> init() async {
  //api clients
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

// repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  //controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
