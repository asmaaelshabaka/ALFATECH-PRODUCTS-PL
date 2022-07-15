import 'package:alfatech/core/view-model/auth_view_model.dart';
import 'package:alfatech/core/view-model/cart_view_model.dart';
import 'package:alfatech/model/CartProduct_model.dart';
import 'package:alfatech/view/Home_View.dart';
import 'package:get/get.dart';
import '../core/view-model/control_view_model.dart';
import '../core/view-model/home_view_model.dart';




class Binding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => HomeView());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => CartViewModel());
  }
}