
import 'dart:developer';

import 'package:electricity/data/controllers/auth_controller.dart';
import 'package:electricity/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:electricity/utils/app_constants.dart';

class PreferenceService{

  
  
  saveToken(String tokenValue) async
  {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(APPConstants.token, tokenValue);
    log(' this is the saved Token : ${prefs.setString(APPConstants.token, tokenValue).toString()}');
  }
  getToken()async
  {
    final prefs = await SharedPreferences.getInstance();
    var res = prefs.getString(APPConstants.token);
    log('the received token is : $res');

    if(res!=null)
    {
      isLoggedIn = true;
      setisLoggedIn(isLoggedIn!);
      log('This is the received value of isLoggedIn : ${isLoggedIn.toString()}');
       
    }
    return res;
  }
    setisOnboarding() async {
    int isviewed = 1;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt("initScreen", isviewed);
  }

  Future<int?> getIsOnboarding() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt('initScreen');
  }

  setisLoggedIn(bool value)async
  {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool('isLoggedIn', value);
  }
  getisLoggedIn()async{
      SharedPreferences preferences = await SharedPreferences.getInstance();
      bool? value =   preferences.getBool('isLoggedIn');
      return value;
  }
  saveUsername() async
  {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('username', AuthController.i.name.text);
  }
  getUsername()async
  {
    SharedPreferences preferences = await SharedPreferences.getInstance();
   String name = preferences.getString('username') ?? '' ;
   return name;
  }
}
