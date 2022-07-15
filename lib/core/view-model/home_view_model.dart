import 'package:alfatech/core/services/home_Services.dart';
import 'package:alfatech/model/Category_model.dart';
import 'package:alfatech/model/Products_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  List<CategoryModel> get categoryModel => _categoryModel;
  List<CategoryModel> _categoryModel = [];
  List<ProductsModel> get productsModel => _ProductsModel;
  List<ProductsModel> _ProductsModel = [];
  HomeViewModel() {
    getCategory();
    getBestSellingBroducts();
  }
  // final CollectionReference _CategoryCollectionRef =
  // FirebaseFirestore.instance.collection('Category');

  getCategory() async {
    _loading.value = true;
    HomeServices().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(CategoryModel.fromJson(value[i].data() as Map));

        _loading.value = false;
      }
      update();
    });
  }

  getBestSellingBroducts() async {
    _loading.value = true;
    HomeServices().getBestSelling().then((value)
    {
      for(int i=0;i<value.length;i++)
        {
          _ProductsModel.add(ProductsModel.formJson(value[i].data()as Map));
          _loading.value=false;



        }
      update();


    });
  }
}
