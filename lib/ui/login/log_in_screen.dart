import 'dart:developer';

import 'package:electricity/data/controllers/auth_controller.dart';
import 'package:electricity/data/repos/auth_repo.dart';
import 'package:electricity/ui/common/colors.dart';
import 'package:electricity/ui/common/images.dart';
import 'package:electricity/ui/signup/sign_up_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../common/custom_button.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ksecondaryColor,
      body: Stack(alignment: AlignmentDirectional.topCenter, children: [
        Image.asset(Images.topvector1),
        Padding(
          padding: const EdgeInsets.only(top: 147),
          child: Image.asset(Images.login),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 300, left: 15, right: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Log In',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: Get.height * .05,
                ),
                TextFormField(
                  controller: AuthController.i.username,
                  cursorColor: kblackColor,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.email_outlined),
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder()),
                ),
                SizedBox(
                  height: Get.height * .03,
                ),
                TextFormField(
                  controller: AuthController.i.userPassword,
                  obscureText: obscureText,
                  cursorColor: kblackColor,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      suffixIcon: IconButton(
                        icon: obscureText
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                        onPressed: () {
                          obscureText = !obscureText;
                          setState(() {});
                        },
                      ),
                      hintText: 'Password',
                      prefixIcon: const Icon(Icons.lock_outlined),
                      enabledBorder: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder()),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () {},
                      child:  Text('forgotPassword'.tr)),
                ),
                SizedBox(
                  height: Get.height * .03,
                ),
                Custombutton(
                  title: 'login'.tr,
                  onPresse: () {
                    AuthRepo().loginWithEmail();
                    log('Grid Info'.toString());
                  },
                ),
                SizedBox(
                  height: Get.height * .01,
                ),
                const Text(textAlign: TextAlign.center, 'OR'),
                SizedBox(
                  height: Get.height * .01,
                ),
                Custombutton(
                  color: const Color(0x0f000000),
                  onPresse: () {
                    AuthRepo().signInwithGoogle();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Images.google,
                        height: Get.height * .04,
                      ),
                      SizedBox(
                        width: Get.width * .05,
                      ),
                       Text(
                        "loginWithGoogle".tr,
                        style: const TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("donthaveAnAccount"),
                    TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () {
                          log('Create account'.toString());
                          Get.to(()=>const SignUpScreen());
                        },
                        child: const Text('Register'))
                  ],
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
