import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../models/weather_model.dart';
import '../repos/weather_repo.dart';

class WeatherController extends GetxController implements GetxService{
  
  String? country;
  double? temperature;
  String? weatherDescription;
  double? windSpeed;
  double? currentHumidity;
  DateTime currentDateTime = DateTime.now();
  DateTime tomorrow = DateTime.now().add(const Duration(days: 1));
  String formattedDate = DateFormat('dd-MMM-yyyy').format(DateTime.now());  
  int selectedindex = 0;
  
  List<WeatherModel> weatherData = [];
  List<WeatherModel> weeklyWeatherData = [];



@override
  void onInit() {
    
    getWeatherData();
    super.onInit();
  }

  updateIndex(int index)
  {
    selectedindex = index;
    update();
  }
  
  getWeatherData()async
  {
     WeatherRepo().getCurrentLocation().then((value) async{
      List<Placemark> address =  await placemarkFromCoordinates(value.latitude,value.longitude);
      log('address is ? $address');
      country = address[0].country;
      WeatherRepo().getWeatherData(value);
      WeatherRepo().getHourlyWeatherData(value);
      WeatherRepo().getDailyWeatherData(value);      
     });
     update();
  }



  getTemperature(double temp, String description, double speed, double humidity){
    temperature = temp;
    weatherDescription = description;
    windSpeed = speed;
    currentHumidity = humidity;
    update();
  }

  
  static WeatherController get i => Get.put(WeatherController());
}