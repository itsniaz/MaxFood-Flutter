
import 'package:flutter/cupertino.dart';
import 'package:max_food/viewmodel/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PrefKeys
{
  static String NAME = "name";
  static String EMAIL = "email";
  static String TOKEN = "token";
  static String PHONE = "token";
}

class SharedPrefManager{

  static SharedPrefManager _sharedPrefManager;

  static SharedPrefManager getInstance() {
    if (_sharedPrefManager == null) {
      _sharedPrefManager = SharedPrefManager();
    }
    return _sharedPrefManager;
  }


  void setName({String name}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(PrefKeys.NAME, name);
  }


  Future<String> getName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(PrefKeys.NAME);
  }

  void setEmail({String email}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(PrefKeys.EMAIL, email);
  }


  Future<String> getEmail() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(PrefKeys.EMAIL);
  }

  void setToken({String token}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(PrefKeys.TOKEN, token);
  }


  Future<String> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(PrefKeys.TOKEN);
  }

  void setPhone({String phone}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(PrefKeys.PHONE, phone);
  }


  Future<String> getPhone() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(PrefKeys.PHONE);
  }

  void saveUser(User user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(PrefKeys.NAME, user.name);
    pref.setString(PrefKeys.EMAIL, user.email);
    pref.setString(PrefKeys.PHONE, user.phone);
    pref.setString(PrefKeys.TOKEN, user.token);
  }



}