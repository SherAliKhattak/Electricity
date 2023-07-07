import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../ui/common/snackbar.dart';

class AuthController extends GetxController implements GetxService{

  File? file;
  //registration Controllers
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController password;
  // login controllers
  late TextEditingController username;
  late TextEditingController userPassword;

  @override
  void onInit() {
    name = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    userPassword = TextEditingController();
    
 
    super.onInit();

  }

    Future<File?> pickImage(
    BuildContext context,
  ) async {
    try {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(type: FileType.image);
      if (result != null) {
        file = File(result.files.first.path!);
      }
    } catch (e) {
      showSnackbar(context, e.toString());
    }
    update();
    return file;
  }

  @override
  void onClose() {
    name.dispose();
    email.dispose();
    password.dispose();
    username.dispose();
    userPassword.dispose();

    super.onClose();
  }

  static AuthController get i => Get.put(AuthController());

}