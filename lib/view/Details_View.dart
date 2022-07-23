import 'package:alfatech/core/view-model/cart_view_model.dart';
import 'package:alfatech/model/CartProduct_model.dart';
import 'package:alfatech/model/Products_model.dart';
import 'package:alfatech/view/widgets/custom_Button.dart';
import 'package:alfatech/view/widgets/custom_txt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Card_View.dart';

class DetailsView extends StatelessWidget {
  ProductsModel? Model;
  DetailsView({this.Model});
  CartProductModel? CModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Image.network(
                Model!.image.toString(),
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(18),
                  child: Column(
                    children: [
                      CustomTxt(Model!.name.toString(), Colors.redAccent, 26, 1,
                          Alignment.topLeft),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Container(
                            child: Container(
                                padding: EdgeInsets.all(16),
                                width: MediaQuery.of(context).size.width * .35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.grey)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CustomTxt('Brand', Colors.black, 10, 1,
                                        Alignment.center),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    CustomTxt(Model!.mainBrand.toString(),
                                        Colors.black, 12, 1, Alignment.center)
                                  ],
                                )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Container(
                                padding: EdgeInsets.all(16),
                                width: MediaQuery.of(context).size.width * .35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.grey)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CustomTxt('Price', Colors.black, 10, 1,
                                        Alignment.center),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    CustomTxt(
                                        Model!.price.toString() + ' ' + 'EGP',
                                        Colors.redAccent,
                                        12,
                                        1,
                                        Alignment.center)
                                  ],
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTxt(
                          'Details', Colors.black, 15, 1, Alignment.topLeft),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTxt(Model!.description.toString(), Colors.black, 12,
                          2.0, Alignment.topLeft)
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: GetBuilder<CartViewModel>(
                init: CartViewModel(),
                builder: (controller) => Container(

                    //CustomTxt('Price', Colors.redAccent, 20, 1, Alignment.topLeft),
                    //SizedBox(width: 10,),
                    //CustomTxt(Model!.price.toString()+' '+'EGP', Colors.red, 18, 1, Alignment.topLeft)
                    child: CustomButton('Add To Card', () {
                      controller.addProduct(CartProductModel(Model!.name, Model!.image, Model!.price, 1,Model!.productId));
                  Get.to(CardView());
                })),
              ),
            )
          ],
        ),
      ),
    );
  }
}
