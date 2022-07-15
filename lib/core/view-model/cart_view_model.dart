import 'package:alfatech/core/services/DataBase/Cart_database_helper.dart';
import 'package:alfatech/model/CartProduct_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  CartViewModel() {
    getAllProducts();
  }
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  List<CartProductModel> _cartproductmodel = [];
  List<CartProductModel> get cartproductmodel => _cartproductmodel;

  getAllProducts() async {
    _loading.value = true;
    var DBHelper = CartDataBaseHelper.db;
    _cartproductmodel = await DBHelper.GetAllProducts();
    _loading.value = false;
    update();
    print(cartproductmodel.length.toString());
  }

  addProduct(CartProductModel cartProductModel) async {
    if (_cartproductmodel.length == 0) {
      var DBHelper = CartDataBaseHelper.db;
      await DBHelper.insert(cartProductModel);
    }else{  for (int i = 0; i < _cartproductmodel.length; i++) {
      if (_cartproductmodel[i].productId == cartProductModel.productId) {
        return;
      } else {
        var DBHelper = CartDataBaseHelper.db;
        await DBHelper.insert(cartProductModel);
      }
    }}


    update();
  }
}
