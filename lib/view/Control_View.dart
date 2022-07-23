import 'package:alfatech/core/view-model/auth_view_model.dart';
import 'package:alfatech/core/view-model/control_view_model.dart';
import 'package:alfatech/view/Card_View.dart';
import 'package:alfatech/view/Home_View.dart';
import 'package:alfatech/view/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Profile_View.dart';

class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user != null)
          ?
           GetBuilder<ControlViewModel>(
             init: ControlViewModel(),
              builder: (controller) => Scaffold(
                body: controller.CurrentScreen,
               bottomNavigationBar: bottomNavigationBar(),
              ),
            ):LoginScreen();
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: Get.put(ControlViewModel()),
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              activeIcon: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text('Profile')),
              label: '',
              icon: Image.asset(
                'assets/images/personIcon.png',
                fit: BoxFit.contain,
                width: 20,
              )),
          BottomNavigationBarItem(
              activeIcon: Padding(
                  padding: const EdgeInsets.only(top: 15), child: Text('Home')),
              label: '',
              icon: Image.asset(
                'assets/images/HomeIcon.png',
                fit: BoxFit.contain,
                width: 20,
              )),
          BottomNavigationBarItem(
              activeIcon: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text('Brands')),
              label: '',
              icon: Image.asset(
                'assets/images/BrandIcon.png',
                fit: BoxFit.contain,
                width: 20,
              )),
        ],
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          controller.changeSelectedValue(index);
        },
        elevation: 0,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade50,
      ),
    );
  }
}
