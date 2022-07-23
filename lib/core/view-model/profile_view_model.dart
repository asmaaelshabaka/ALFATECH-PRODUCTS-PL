import 'package:alfatech/helper/local_storage_data.dart';
import 'package:alfatech/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';


class ProfileViewMobel extends GetxController
{


  ValueNotifier<bool> get loading=>_loading;
  ValueNotifier<bool>  _loading=ValueNotifier(false);




  @override
  onInit()
  {
    super.onInit();
    getCurrentUser();


  }
  UserModel get userModel=>_userModel;
  late UserModel _userModel;
  final LocalStorageData localStorageData=Get.find();
  Future<void> signOut()async
  {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();

  }

  void getCurrentUser()async
  {
    _loading.value=true;
    await localStorageData.getUser.then((value) => {_userModel=value!});
    _loading.value=false;
    update();


  }


}