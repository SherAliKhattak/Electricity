import 'dart:ui';

import 'package:get/get.dart';

class LanguageController extends GetxController implements GetxService {
  int selectedIndex = 0;

  updateSelectedIndex(int index) {
    selectedIndex = index;
    update();
  }

  updateLocale(Locale locale) {
    Get.updateLocale(locale);
  }

  static LanguageController get i => Get.put(LanguageController());
}