import 'package:alfatech/const.dart';
import 'package:alfatech/core/view-model/control_view_model.dart';
import 'package:alfatech/core/view-model/home_view_model.dart';
import 'package:alfatech/view/Details_View.dart';
import 'package:alfatech/view/Profile_View.dart';
import 'package:flutter/material.dart';
import 'package:alfatech/view/widgets/custom_txt.dart';
import 'package:get/get.dart';

class HomeView extends GetWidget {
  List<String> OurBrands = <String>['TP', 'PIZZATO', 'AECO', 'AEC', 'MAKEL'];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>( init: Get.put(HomeViewModel()),

      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              body: SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.only(top: 50, left: 20, right: 20),
                    child: Column(
                      children: [
                        _searchTextBox(),
                        SizedBox(
                          height: 20,
                        ),
                        CustomTxt(
                            'Our Brands', Colors.black, 18,1, Alignment.topLeft),
                        SizedBox(
                          height: 20,
                        ),
                        _ListViewCategory(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTxt('Best Selling', Colors.redAccent, 20,1,
                                Alignment.topLeft),
                            CustomTxt(
                                'See all', Colors.black, 12,1, Alignment.topRight)
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        _ListViewProducts()
                      ],
                    )),
              ),
            ),
    );
  }

  Widget _searchTextBox() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.shade200),
        child: TextFormField(
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black,
              )),
        ));
  }

  Widget _ListViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 90,
        child: ListView.separated(
          itemCount: controller.categoryModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white),
                  height: 60,
                  width: 60,
                  child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Image.network(
                          controller.categoryModel[index].image.toString())),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTxt(controller.categoryModel[index].name.toString(),
                    Colors.black, 10,1, Alignment.bottomLeft)
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            width: 10,
          ),
        ),
      ),
    );
  }

  Widget _ListViewProducts() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 280,
        child: ListView.separated(
          itemCount: controller.productsModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(onTap: (){Get.to(DetailsView(Model: controller.productsModel[index]));},
              child: Container(
                width: MediaQuery.of(context).size.width * .4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.shade100),
                child: Column(
                  children: [
                    Container(
                      child: Image.network(
                        controller.productsModel[index].image.toString(),
                        fit: BoxFit.fill,
                      ),
                      height: 200,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTxt(
                        controller.productsModel[index].mainBrand.toString(),
                        Colors.black,
                        10,1,
                        Alignment.bottomLeft),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTxt(controller.productsModel[index].name.toString(),
                        Colors.black, 10,1, Alignment.bottomLeft),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTxt(
                      controller.productsModel[index].price.toString() +
                          ' ' +
                          'EGP',
                      Colors.redAccent,
                      10,1,
                      Alignment.bottomLeft,
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            width: 10,
          ),
        ),
      ),
    );
  }
}
