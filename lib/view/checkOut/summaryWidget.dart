import 'package:alfatech/core/view-model/cart_view_model.dart';
import 'package:alfatech/view/widgets/custom_txt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CartViewModel>(
        builder: (controller) => Container(width: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                  height: 350,
                  padding: EdgeInsets.all(20),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                      child: Column(
                        children: [
                          Container(
                            width: 150,
                            height: 180,
                            child: Image.network(controller.cartproductmodel[index].image.toString(),fit: BoxFit.fitWidth,),
                          ),CustomTxt(controller.cartproductmodel[index].name.toString(), Colors.black, 18, 1, Alignment.center),
                          CustomTxt(controller.cartproductmodel[index].price.toString(), Colors.black, 18, 1, Alignment.center)
                        ],
                      ),
                    ),
                    itemCount: controller.cartproductmodel.length,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
