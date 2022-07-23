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
  double get totalPrice=>_totalPrice;
  double _totalPrice=0.0;

  getAllProducts() async {
    _loading.value = true;
    var DBHelper = CartDataBaseHelper.db;
    _cartproductmodel = await DBHelper.GetAllProducts();
    _loading.value = false;
    getTotalPrice();
    update();
    print(cartproductmodel.length.toString());
  }

  addProduct(CartProductModel cartProductModel) async {
    if (_cartproductmodel.length == 0) {
      var DBHelper = CartDataBaseHelper.db;
      await DBHelper.insert(cartProductModel);
      _cartproductmodel.add(cartProductModel);
    } else {
      for (int i = 0; i < _cartproductmodel.length; i++) {
        if (_cartproductmodel[i].productId == cartProductModel.productId) {
          return;
        } else {

        }
        var DBHelper = CartDataBaseHelper.db;
        await DBHelper.insert(cartProductModel);
        _cartproductmodel.add(cartProductModel);
        _totalPrice +=
        (double.parse(cartProductModel.price!) * cartProductModel.quantity!);
      }
      // }

      update();
    }
  }
  getTotalPrice()
  {
    for(int i=0;i<_cartproductmodel.length;i++)
      {

        _totalPrice+=(double.parse(_cartproductmodel[i].price!)*_cartproductmodel[i].quantity!);
        print(_totalPrice);
        update();

      }

  }
  increaseQuantity(int index)async
  {
    _cartproductmodel[index].quantity!+1;
    _totalPrice+=(double.parse(_cartproductmodel[index].price!)*_cartproductmodel[index].quantity!);
    var DBHelper = CartDataBaseHelper.db;
   await DBHelper.updateProduct(_cartproductmodel[index]);

    update();

  }
  decreaseQyantity(int index)async
  {
    _cartproductmodel[index].quantity!-1;
    _totalPrice-=(double.parse(_cartproductmodel[index].price!)*_cartproductmodel[index].quantity!);
    var DBHelper = CartDataBaseHelper.db;
    await DBHelper.updateProduct(_cartproductmodel[index]);

    update();
  }
}
