import 'dart:convert';
import 'dart:developer';
import 'package:electricity/data/controllers/auth_controller.dart';
import 'package:electricity/data/controllers/load_shedding_controller.dart';
import 'package:electricity/data/services/local_db/local_db.dart';
import 'package:electricity/ui/common/colors.dart';
import 'package:electricity/ui/common/snackbar.dart';
import 'package:electricity/ui/grid_Info/grid_info_screen.dart';
import 'package:electricity/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

import '../controllers/grid_info_controller.dart';

class AuthRepo {
  Future<void> registerWithEmail() async {
    var token = await PreferenceService().getToken();
    try {
      var headers = {
        'Authorization': 'Bearer $token',
      };
      var url = Uri.parse(
        APPConstants.baseURL + APPConstants.registerURI,
      );
      Map body = {
        'full_name': AuthController.i.name.text.trim(),
        'email': AuthController.i.email.text.trim(),
        'password': AuthController.i.password.text,
      };
      log(url.toString());
      http.Response response =
          await http.post(url, body: body, headers: headers);
      log(response.body);
      if (response.statusCode == 200) {
        log('i am here');
        final json = jsonDecode(response.body);
        if (json['success'] == true) {
          var token = json['data']['token'];
          PreferenceService().saveToken(token);
          PreferenceService().saveUsername();
          GridInfoController.i.populateDropdown();
          LoadsheddingController.i.getLoadshedding();

          log(token);
          showSnackbar(Get.context!, jsonDecode(response.body)['message'],
              color: kgreenColor);
          Get.offAll(() => const GridInfoScreen());
        } else {
          throw jsonDecode(response.body)['message'] ??
              'An unknown error Ocured';
        }
      }
      if (response.statusCode == 401) {
        showSnackbar(Get.context!,
            jsonDecode(response.body)['message'] ?? 'An unknown Error occured',
            color: kredColor);
      }
      if (response.statusCode == 404) {
        showSnackbar(Get.context!,
            jsonDecode(response.body)['message'] ?? 'An unknown Error occured',
            color: kredColor);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> loginWithEmail() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
        APPConstants.baseURL + APPConstants.loginURI,
      );
      Map body = {
        'email': AuthController.i.username.text.trim(),
        'password': AuthController.i.userPassword.text,
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);
      log(response.body);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['success'] == true) {
          var token = json['data']['token'];
          PreferenceService().saveToken(token);
          GridInfoController.i.populateDropdown();
          LoadsheddingController.i.getLoadshedding();
          showSnackbar(Get.context!, jsonDecode(response.body)['message'],
              color: kgreenColor);
          Get.offAll(() => const GridInfoScreen());
          log(token);
        } else {
          throw jsonDecode(response.body)['message'] ??
              'An unknown error Occured';
        }
      } else if (response.statusCode == 401) {
        showSnackbar(Get.context!, 'UnAuthorized', color: kredColor);
      } else {
        showSnackbar(Get.context!,
            jsonDecode(response.body)['message'] ?? 'An Unknown Error occured',
            color: kredColor);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future signUpwithGoogle() async {
    final user = await GoogleSignInApI.login();
    
    if(user!= null){
     var token = await PreferenceService().getToken();
    try {
      var headers = {
        'Authorization': 'Bearer $token',
      };
      var url = Uri.parse(
        APPConstants.baseURL + APPConstants.registerURI,
      );
      Map body = {
        'full_name': user.displayName,
        'email': user.email,
        'password': user.id,
      };
      log(url.toString());
      http.Response response = 
          await http.post(url, body: body, headers: headers);
      log(response.body);
      if (response.statusCode == 200) {
        log('i am here');
        final json = jsonDecode(response.body);
        if (json['success'] == true) {
          var token = json['data']['token'];
          PreferenceService().saveToken(token);
          PreferenceService().saveUsername();
          GridInfoController.i.populateDropdown();
          LoadsheddingController.i.getLoadshedding();

          log(token);
          showSnackbar(Get.context!, jsonDecode(response.body)['message'],
              color: kgreenColor);
          Get.offAll(() => const GridInfoScreen());
        } else {
          throw jsonDecode(response.body)['message'] ??
              'An unknown error Ocured';
        }
      }
      if (response.statusCode == 401) {
        showSnackbar(Get.context!,
            jsonDecode(response.body)['message'] ?? 'An unknown Error occured',
            color: kredColor);
      }
      if (response.statusCode == 404) {
        showSnackbar(Get.context!,
            jsonDecode(response.body)['message'] ?? 'An unknown Error occured',
            color: kredColor);
      }
    } catch (e) {
      log(e.toString());
    }
    }
    else{
      showSnackbar(Get.context!, 'Failed to login. Try again');
    }
  }

  Future signInwithGoogle() async {
    final user = await GoogleSignInApI.login();
    
    if(user!= null){
     var token = await PreferenceService().getToken();
    try {
      var headers = {
        'Authorization': 'Bearer $token',
      };
      var url = Uri.parse(
        APPConstants.baseURL + APPConstants.loginURI,
      );
      Map body = {
        'email': user.email,
        'password': user.id,
      };
      log(url.toString());
      http.Response response = 
          await http.post(url, body: body, headers: headers);
      log(response.body);
      if (response.statusCode == 200) {
        log('i am here');
        final json = jsonDecode(response.body);
        if (json['success'] == true) {
          var token = json['data']['token'];
          PreferenceService().saveToken(token);
          PreferenceService().saveUsername();
          GridInfoController.i.populateDropdown();
          LoadsheddingController.i.getLoadshedding();

          log(token);
          showSnackbar(Get.context!, jsonDecode(response.body)['message'],
              color: kgreenColor);
          Get.offAll(() => const GridInfoScreen());
        } else {
          throw jsonDecode(response.body)['message'] ??
              'An unknown error Ocured';
        }
      }
      if (response.statusCode == 401) {
        showSnackbar(Get.context!,
            jsonDecode(response.body)['message'] ?? 'An unknown Error occured',
            color: kredColor);
      }
      if (response.statusCode == 404) {
        showSnackbar(Get.context!,
            jsonDecode(response.body)['message'] ?? 'An unknown Error occured',
            color: kredColor);
      }
    } catch (e) {
      log(e.toString());
    }
    }
    else{
      showSnackbar(Get.context!, 'Failed to login. Try again');
    }
  }
}

class GoogleSignInApI {
  static final _googleSignin = GoogleSignIn();

  static Future<GoogleSignInAccount?> login() => _googleSignin.signIn();
}
