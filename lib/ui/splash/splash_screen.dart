import 'package:electricity/data/services/local_db/local_db.dart';
import 'package:electricity/ui/common/colors.dart';
import 'package:electricity/ui/common/images.dart';
import 'package:electricity/ui/login/log_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common/custom_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    PreferenceService().setisOnboarding();
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Images.topvector,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            child: Image.asset(
              Images.electric,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Image.asset(Images.bottomvector,fit: BoxFit.cover,width: Get.width,height: 300,)),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    "dontgetCaughtIntheDark".tr,
                    style: const  TextStyle(fontSize: 24),
                  ),
                ),
                const Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12),
                ),
                Custombutton(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 30),
                  onPresse: () {
                    Get.offAll(()=>const LogInScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text('getStarted'.tr,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: ksecondaryColor)),
                      Image.asset(Images.lightning)
                    ],
                  ),
                )
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
