import 'dart:developer';

import 'package:electricity/data/controllers/auth_controller.dart';
import 'package:electricity/data/repos/auth_repo.dart';
import 'package:electricity/ui/login/log_in_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../common/colors.dart';
import '../common/images.dart';
import '../common/custom_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ksecondaryColor,
      body: Stack(alignment: AlignmentDirectional.topCenter, children: [
        Image.asset(Images.topvector1),
        Padding(
          padding: const EdgeInsets.only(top: 110,),
          child: Image.asset(Images.signup),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 300, left: 15, right: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  textAlign: TextAlign.center,
                  'Create your\naccount',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: Get.height * .01,
                ),
                TextFormField(
                  controller: AuthController.i.name,
                  cursorColor: kblackColor,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      hintText: 'Name',
                      prefixIcon: Icon(Icons.person),
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder()),
                ),
                SizedBox(
                  height: Get.height * .03,
                ),
                TextFormField(
                  controller: AuthController.i.email,
                  cursorColor: kblackColor,
                  decoration:  InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      hintText: 'email'.tr,
                      prefixIcon: const Icon(Icons.email_outlined),
                      enabledBorder:const  OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder()),
                ),
                SizedBox(
                  height: Get.height * .03,
                ),
                TextFormField(
                  controller: AuthController.i.password,
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
                      hintText: 'password'.tr,
                      prefixIcon: const Icon(Icons.lock_outlined),
                      enabledBorder: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder()),
                ),
                SizedBox(
                  height: Get.height * .03,
                ),
                const Text(
                    textAlign: TextAlign.center,
                    "If you sign up, you agree to the"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () {},
                        child: const Text("Terms & Conditions")),
                    const Text(' and'),
                    TextButton(
                        style: TextButton.styleFrom(),
                        onPressed: () {},
                        child: const Text("Privacy Policy.")),
                  ],
                ),
                Custombutton(
                  title: 'Signup'.tr,
                  onPresse: () {
                    AuthRepo().registerWithEmail();
                  },
                ),
                SizedBox(height: Get.height*0.02,),
                Custombutton(
                  color: const Color(0x0f000000),
                  onPresse: () {
                    AuthRepo().signUpwithGoogle();
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
                      const Text(
                        "Sign up with google",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account"),
                    TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () {
                          Get.to(const LogInScreen());
                          log('Log in'.toString());
                        },
                        child: const Text('Log In'))
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
