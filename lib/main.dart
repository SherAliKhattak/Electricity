import 'dart:developer';

import 'package:electricity/data/controllers/auth_controller.dart';
import 'package:electricity/data/services/local_db/local_db.dart';
import 'package:electricity/ui/grid_Info/grid_info_screen.dart';
import 'package:electricity/ui/login/log_in_screen.dart';
import 'package:electricity/ui/splash/splash_screen.dart';
import 'package:electricity/utils/init.dart';
import 'package:electricity/utils/languages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

int? initScreen;
bool? isLoggedIn;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  initScreen = await PreferenceService().getIsOnboarding();
  isLoggedIn = await PreferenceService().getisLoggedIn();
  AuthController.i.name.text = await PreferenceService().getUsername();
  log(AuthController.i.name.text);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
       translations: Localization(),
      initialBinding: HomeBinding(),
      locale: const Locale('en', 'US'),
      theme: ThemeData(fontFamily: GoogleFonts.poppins().fontFamily),
      debugShowCheckedModeBanner: false,
      title: 'Electricity',
      home: initScreen == 0 || initScreen == null
          ? const SplashScreen()
          : isLoggedIn == true
              ? const GridInfoScreen()
              : const LogInScreen(),
    );
  }
}
