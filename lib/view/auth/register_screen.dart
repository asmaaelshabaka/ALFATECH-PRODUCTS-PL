import 'package:alfatech/core/view-model/auth_view_model.dart';
import 'package:alfatech/view/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alfatech/view/widgets/custom_Button.dart';
import 'package:alfatech/view/widgets/custom_social_button.dart';
import 'package:alfatech/view/widgets/custom_txt.dart';
import 'package:alfatech/view/widgets/custom_Txt_Form_Text_Filed.dart';

class RegisterScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _FormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(onTap: (){Get.off(LoginScreen());},
            child: Icon(
          Icons.arrow_back,
          color: Colors.black,
        )),
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
          child: Form(
            key: _FormKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTxt(
                        'Sign Up', Colors.black, 30.0,1, Alignment.topRight),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),

                SizedBox(
                  height: 30,
                ),
                CustomFormTextField('Name', 'Asmaa Elshabaka', (v) {
                  controller.Name = v;
                }, () {}),
                SizedBox(
                  height: 40,
                ),
                CustomFormTextField('Email', 'asmaaelshabaka@gmail.com', (v) {
                  controller.Email = v;
                }, () {}),

                SizedBox(
                  height: 40,
                ),

                CustomFormTextField('Password', '****************', (v) {
                  controller.Password = v;
                }, () {}),
                SizedBox(
                  height: 10,
                ),

                SizedBox(
                  height: 10,
                ),
                CustomButton('Sign Up', () {
                  if (_FormKey.currentState!.validate()) {
                    _FormKey.currentState!.save();
                  }
                  //_FormKey.currentState.save();
                  controller.signUpWithEmailAndPassword();
                }),
                // RoundedButton(title: 'title', onPressed: (){Get.to(SecondScreen());}),
                // FlatButton(onPressed: (){Get.to(SecondScreen());}, child: Text('test')),

                SizedBox(
                  height: 20,
                ),
              ],
            ),
          )),
    );
  }
}
