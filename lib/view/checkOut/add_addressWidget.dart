import 'package:alfatech/view/widgets/custom_Txt_Form_Text_Filed.dart';
import 'package:alfatech/view/widgets/custom_txt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            SizedBox(height: 40,),
              CustomTxt('Billing Address is the same as deliverly address', Colors.black, 20, 1, Alignment.center),
              SizedBox(height: 40,),
              CustomFormTextField('Street 1', '275,october Egypt', (p0) => null, (){}),
              SizedBox(height: 40,),
              CustomFormTextField('Street 2', '280,Giza Egypt', (p0) => null, (){}),
              SizedBox(height: 40,),
              CustomFormTextField('City', '280,Giza Egypt', (p0) => null, (){}),
              Container(width: Get.width,child:
              Row(children: [
                Expanded(child: Padding(padding:EdgeInsets.only(left: 20),child: CustomFormTextField('State', 'Giza', (p0) => null, (){}))),
                Expanded(child: Padding(padding:EdgeInsets.only(right: 20),child: CustomFormTextField('Country', '280,Giza Egypt', (p0) => null, (){}))),],),)
            ],
          ),
        ),
      ),
    );
  }
}
