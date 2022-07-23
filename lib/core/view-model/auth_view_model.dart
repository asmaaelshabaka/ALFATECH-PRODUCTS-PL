import 'dart:ffi';

import 'package:alfatech/helper/local_storage_data.dart';
import 'package:alfatech/model/user_model.dart';
import 'package:alfatech/view/Home_View.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:alfatech/core/services/fireStore_user.dart';

import '../../view/Control_View.dart';

class AuthViewModel extends GetxController {
  int counter = 0;
  GoogleSignIn _SigninWithGoogle = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _Auth = FirebaseAuth.instance;
  FacebookLogin _facebookLogin = FacebookLogin();
  String? Email, Password, Name;
  // Rx<User>=Rx<User>();
  Rxn<User> _user = Rxn<User>();
  String? get user => _user.value?.email;
  final LocalStorageData localStorageData = Get.find();
  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
    _user.bindStream(_Auth.authStateChanges());
    if(_Auth.currentUser!=null)
      {

        getCurrentUserData(_Auth.currentUser!.uid);

      }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void increment() {
    counter++;
    update();
  }

  void GoogleSinInMethod() async {
    final GoogleSignInAccount? UserGoogleAccount =
        await _SigninWithGoogle.signIn();
    print(UserGoogleAccount);
    GoogleSignInAuthentication? googleSinInAuth =
        await UserGoogleAccount?.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSinInAuth?.idToken,
        accessToken: googleSinInAuth?.accessToken);
    UserCredential userCredential =
        await _Auth.signInWithCredential(credential).then((user) {
      saveUser(user);
      Get.offAll(ControlView());
      return user;
    });
  }

  void FacebookSignInMethod() async {
    FacebookLoginResult Result = await _facebookLogin.logIn();
    final accessToken = Result.accessToken;
    if (Result.status == FacebookLoginStatus.success) {
      final FacebookCredintial =
          FacebookAuthProvider.credential(accessToken.toString());
      await _Auth.signInWithCredential(FacebookCredintial).then((user) {
        saveUser(user);
      });
    }
  }

  void signInWithEmailAndPassword() async {
    try {
      await _Auth.signInWithEmailAndPassword(email: Email!, password: Password!)
          .then((value) async {
        await FireStoreUser()
            .getCurrentUser(value.user!.uid.toString())
            .then((value) {
          setUser(UserModel.fromJson(value.data() as Map));
        });
      });
      Get.offAll(ControlView());
    } catch (e) {
      Get.snackbar('Error Login Account', e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
      print(e);
    }
  }

  void signUpWithEmailAndPassword() async {
    try {
      await _Auth.createUserWithEmailAndPassword(
              email: Email!, password: Password!)
          .then((user) async {
        //   UserModel usermodel=
        saveUser(user);
      });

      Get.offAll(ControlView());
    } catch (e) {
      Get.snackbar('Error Login Account', e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
      print(e);
    }
  }

  void saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
        Name: Name, Email: user.user!.email, Pic: '', UserId: user.user!.uid);
    await FireStoreUser().addUsertoFireStore(userModel);
    setUser(userModel);
  }

  void setUser(UserModel userModel) async {
    await localStorageData.setUser(userModel);
  }
  void getCurrentUserData(String UID)async
  {
    await FireStoreUser().getCurrentUser(UID).then((value) {setUser(UserModel.fromJson(value.data() as Map));});


  }
}
