import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../view/Card_View.dart';
import '../../view/Home_View.dart';
import '../../view/Profile_View.dart';

class ControlViewModel extends GetxController
{
 Widget CurrentScreen=HomeView();
 //get currentScreen=>_CurrentScreen;

 int _NavigationValye=0;
 get navigatorValue=> _NavigationValye;
 void changeSelectedValue(int selectedValue)
 {
_NavigationValye=selectedValue;
switch(selectedValue)
{
 case 0:{CurrentScreen=HomeView();break;}
 case 1:{CurrentScreen=ProfileView();break;}
 case 2:{CurrentScreen=CardView();break;}




}
update();
 }


}