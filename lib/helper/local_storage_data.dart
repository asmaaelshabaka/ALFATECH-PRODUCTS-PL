import 'dart:convert';

import 'package:alfatech/model/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../const.dart';

class LocalStorageData extends GetxController {


  Future<UserModel?> get getUser async
  {
    try{
      UserModel userModel=await _getUserData();
      if(userModel==null)
        {return null;}
     return userModel;
    }
        catch(e)
    {print(e);}

  }


  _getUserData() async {
    SharedPreferences Prefs = await SharedPreferences.getInstance();
    var value=Prefs.getString(CACHED_USER_DATA);
    return UserModel.fromJson(json.decode(value.toString()));
  }

  setUser(UserModel userModel) async {
    SharedPreferences Prefs = await SharedPreferences.getInstance();
    Prefs.setString(CACHED_USER_DATA, json.encode(userModel.toJson()));
  }

  void deleteUser()async
  {
    SharedPreferences Pref=await SharedPreferences.getInstance();
   await Pref.clear();


  }


}
