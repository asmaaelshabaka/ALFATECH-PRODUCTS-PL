import 'package:alfatech/view/auth/SecondScreen.dart';
import 'package:alfatech/view/auth/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:alfatech/const.dart';
import 'package:alfatech/view/widgets/custom_txt.dart';
import 'package:alfatech/view/widgets/custom_Txt_Form_Text_Filed.dart';
import 'package:alfatech/view/widgets/custom_Button.dart';
import 'package:alfatech/view/widgets/custom_social_button.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';
import 'package:get/get.dart';
import 'package:alfatech/core/view-model/auth_view_model.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _FormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
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
                        'Welcome', Colors.black, 30.0,1, Alignment.topRight),
                    GestureDetector(
                        onTap: () {Get.to(RegisterScreen());},
                        child: CustomTxt(
                            'Sign Up', Colors.red, 10.0,1, Alignment.topLeft)),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTxt(
                    'Sign in to continue', Colors.grey, 14,1, Alignment.topLeft),
                SizedBox(
                  height: 30,
                ),
                CustomFormTextField('Email', 'mozza@yahoo.com', (v) {
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
                CustomTxt(
                    'Forget Password', Colors.black, 14,1, Alignment.topRight),
                SizedBox(
                  height: 10,
                ),
                CustomButton('Sign iiiiiiIn', () {
                  if (_FormKey.currentState!.validate()) {
                    _FormKey.currentState!.save();
                  }
                  //_FormKey.currentState.save();
                  controller.signInWithEmailAndPassword();
                }),
                // RoundedButton(title: 'title', onPressed: (){Get.to(SecondScreen());}),
                // FlatButton(onPressed: (){Get.to(SecondScreen());}, child: Text('test')),

                SizedBox(
                  height: 20,
                ),
                CustomTxt('-OR-', Colors.black, 18, 1,Alignment.center),
                SizedBox(
                  height: 10,
                ),
                CustomSocialButton(
                    'assets/images/facebook.png', 'Sign With Facebook', () {
                  controller.FacebookSignInMethod();
                }),
                SizedBox(
                  height: 5,
                ),
                CustomSocialButton(
                    'assets/images/google.png', 'Sign With Gmail', () {
                  controller.GoogleSinInMethod();
                })
              ],
            ),
          )),
    );
  }
}
