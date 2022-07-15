import 'package:alfatech/core/view-model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alfatech/core/view-model/auth_view_model.dart';
import 'package:alfatech/view/widgets/custom_Button.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: GetBuilder<AuthViewModel>(
                init: AuthViewModel(),
                builder: (value) => Text(value.counter.toString())),
          ),
          GetBuilder<AuthViewModel>(builder:(value)=> CustomButton('inc', (){value.increment();}))

        ],
      ),
    );
  }
}
