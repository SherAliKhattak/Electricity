
import 'package:electricity/data/controllers/grid_info_controller.dart';
import 'package:electricity/data/controllers/language_controller.dart';
import 'package:electricity/data/controllers/load_shedding_controller.dart';
import 'package:electricity/data/controllers/weather_controller.dart';
import 'package:get/get.dart';

import '../data/controllers/auth_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    
    Get.put<AuthController>((AuthController()));
    Get.put<LoadsheddingController>(LoadsheddingController());
    Get.put<GridInfoController>(GridInfoController());
    Get.put<WeatherController>(WeatherController());
    Get.put<LanguageController>(LanguageController());
    
  }
}
