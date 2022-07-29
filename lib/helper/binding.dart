import 'package:alfatech/core/view-model/auth_view_model.dart';
import 'package:alfatech/core/view-model/cart_view_model.dart';
import 'package:alfatech/helper/local_storage_data.dart';
import 'package:alfatech/model/CartProduct_model.dart';
import 'package:alfatech/view/Home_View.dart';
import 'package:alfatech/view/checkOut/add_addressWidget.dart';
import 'package:alfatech/view/checkOut/checkOut_View.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../core/view-model/CheckOut_View_Model.dart';
import '../core/view-model/control_view_model.dart';
import '../core/view-model/home_view_model.dart';
import '../view/checkOut/delevery_timeWidget.dart';
import 'package:alfatech/view/checkOut/summaryWidget.dart';




class Binding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => HomeView());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => LocalStorageData());
    Get.lazyPut(() => CheckOutView());
    Get.lazyPut(() => AddAddress());
    Get.lazyPut(() => DeliveryTime());
    Get.lazyPut(() => checkOutViewModel());
    //Get.lazyPut(() => Summary());


  }
}