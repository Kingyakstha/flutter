import 'package:flutter_projects/models/product_model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../data/repository/cart_repo.dart';
import '../models/cart_model.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int, CartModel> _items = {};

  Map<int, CartModel> get items =>_items;

  void addItem(ProductModel product, int quantity) {
    var totalQuantity=0;
    if (_items.containsKey(product.id)) {
  _items.update(product.id!, (value) {
    totalQuantity=value.quantity!+quantity;

    return CartModel(
      id: value.id,
      name: value.name,
      price: value.price,
      img: value.img,
      quantity: value.quantity!+quantity,
      isExist: true,
      time: DateTime.now().toString(),
    );
  });
  if(totalQuantity<=0){
    _items.remove(product.id);
  }
    }
    else {
      _items.putIfAbsent(product.id!, () {
        return CartModel(
          id: product.id,
          name: product.name,
          price: product.price,
          img: product.img,
          quantity: quantity,
          isExist: true,
          time: DateTime.now().toString(),
        );
      });
    }
  }
  bool existInCart(ProductModel product){
  if(_items.containsKey(product.id)) {
    return true;
  }
  return false;
  }
  getQuantity(ProductModel product)
  {
    var quantity=0;
    if (_items.containsKey(product.id)){
      _items.forEach((key, value) {
        if(key==product.id){
          quantity=value.quantity!;
        }
      });
    }

  }
  int get totalItems{
    var totalQuantity=0;
    _items.forEach((key, value) {
     totalQuantity+= value.quantity!;
    });
    return totalQuantity;
  }

  List<CartModel> get getItems{
   return _items.entries.map((e){
     return e.value;
    }).toList();
  }
}

// print("adding item to cart, cart id: " +
// product.id.toString() +
// "quantity: $quantity");
// _items.forEach((key, value) {
// print("quantity is " + value.quantity.toString());
// });
//
// print("length of the items" + _items.length.toString());
