import 'package:flutter_projects/models/product_model.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../data/repository/popular_product_repo.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    print("loaded ${response.statusCode}");
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      print("Popular product is loaded");
      _isLoaded = true;
      //print(_popularProductList);
      update();
    } else {
      print("Popular product is not loaded");
    }
  }
}
