import 'package:alfatech/view/widgets/custom_txt.dart';
import 'package:flutter/material.dart';
import 'package:alfatech/helper/enum.dart';

class DeliveryTime extends StatefulWidget {
  @override
  State<DeliveryTime> createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {
  Delivery delivery = Delivery.NomonatedDelivery;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          RadioListTile<Delivery>(
            value: Delivery.standardDeliver,
            groupValue: delivery,
            onChanged: (Delivery? value) {

              setState() {
                delivery = value!;
              }
            },
            title: CustomTxt(
                'Custom Delivery', Colors.black, 18, 1, Alignment.center),
            subtitle: CustomTxt(
                'CustomDelivery', Colors.black, 10 ,1, Alignment.center),
            activeColor: Colors.red,
          ),
          SizedBox(height: 10,),
          RadioListTile<Delivery>(selected: delivery.index==MaterialState.selected,
            value: Delivery.nextDayDelivery,
            groupValue: delivery,
            onChanged: (Delivery? value) {
              setState() {
                delivery = value!;
              }
            },
            title: CustomTxt(
                'Next Day Delivey', Colors.black, 18, 1, Alignment.center),
            subtitle: CustomTxt(
                'CustomDelivery', Colors.black, 10, 1, Alignment.center),
            activeColor: Colors.red,
          ),
          SizedBox(height: 10,),
          RadioListTile<Delivery>(
            value: Delivery.NomonatedDelivery,
            groupValue: delivery,
            onChanged: (Delivery? value) {

            },
            title: CustomTxt(
                'Nomonated Deliverly', Colors.black, 18, 1, Alignment.center),
            subtitle: CustomTxt(
                'CustomDelivery', Colors.black, 10 , 1, Alignment.center),
            activeColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
