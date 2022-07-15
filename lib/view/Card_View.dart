import 'package:alfatech/core/view-model/cart_view_model.dart';
import 'package:alfatech/model/CartProduct_model.dart';
import 'package:alfatech/view/widgets/custom_Button.dart';
import 'package:alfatech/view/widgets/custom_txt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardView extends StatelessWidget {
  CardView();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<CartViewModel>(init: CartViewModel(),
              builder:(controller)=> Container(
                  child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    height: 140,
                    child: Row(
                      children: [
                        Container(
                            width: 140,
                            child: Image.network(
                              controller.cartproductmodel[index].image.toString(),
                              fit: BoxFit.fill,
                            )),
                        Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTxt(controller.cartproductmodel[index].name.toString(), Colors.black, 24, 1,
                                  Alignment.center),
                              SizedBox(
                                height: 6,
                              ),
                              CustomTxt(controller.cartproductmodel[index].price.toString() + ' ' + 'EGP',
                                  Colors.red, 18, 1, Alignment.center),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 140,
                                color: Colors.grey.shade200,
                                height: 40,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    CustomTxt('1', Colors.black, 20, 1,
                                        Alignment.center),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                        padding: EdgeInsets.only(bottom: 20),
                                        child: Icon(
                                          Icons.minimize,
                                          color: Colors.black,
                                        ))
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
                itemCount: controller.cartproductmodel.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 10,
                  );
                },
              )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Row(
              children: [
                Column(
                  children: [
                    CustomTxt('Total:', Colors.grey, 22, 1, Alignment.center),
                    SizedBox(
                      height: 15,
                    ),
                    CustomTxt('2000 EGP', Colors.red, 18, 1, Alignment.center),
                    GetBuilder<CartViewModel>(
                       init: CartViewModel(),
                         builder: (controller) => Container(
                             child: CustomButton(
                               'CHECK OUT',(){ controller.addProduct(CartProductModel(
                                 controller.cartproductmodel[0].name.toString(), controller.cartproductmodel[0].image.toString(), controller.cartproductmodel[0].price.toString(),1,controller.cartproductmodel[0].productId.toString()));}
                                )))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
