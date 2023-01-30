import 'package:flutter/material.dart';
import 'package:flutter_projects/controllers/cart_controller.dart';
import 'package:flutter_projects/models/product_model.dart';
import 'package:flutter_projects/utils/colors.dart';
import '../data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;

  int _cartItems = 0;
  int get cartItems => _cartItems + _quantity;

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

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      if (_quantity < 20) {
        _quantity = _quantity + 1;
      } else {
        Get.snackbar("Item count", "You can't add more !",
            backgroundColor: AppColors.mainColor, colorText: Colors.white);
      }
    } else {
      if (_quantity > 0) {
        _quantity = _quantity - 1;
      } else {
        Get.snackbar("Item count", "You can't decrease more !",
            backgroundColor: AppColors.mainColor, colorText: Colors.white);
      }
    }
    update();
  }

  void initProduct(CartController cart) {
    _quantity = 0;
    _cartItems = 0;
    _cart = cart;
  }

  void addItem(ProductModel product) {
    _cart.addItem(product, _quantity);
  }
}
