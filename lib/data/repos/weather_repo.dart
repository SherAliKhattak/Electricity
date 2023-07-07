import 'dart:convert';
import 'dart:developer';
import 'package:electricity/data/controllers/weather_controller.dart';
import 'package:electricity/models/weather_model.dart';
import 'package:electricity/utils/app_constants.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

 class WeatherRepo{
  String? country;
 Future<Position> getCurrentLocation()async
  {
    await Geolocator.requestPermission().then((value) {
    });
    log('location : ${Geolocator.getCurrentPosition().toString()}');
    return Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation,);
  }

  getWeatherData(Position position) async
  {
    log('i am over here');
    var url = 'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=${APPConstants.apiKey}&units=metric';
   try{
     var response = await http.get(Uri.parse(url));
    //  log(response.body);
    if(response.statusCode == 200)
    {
      var data = jsonDecode(response.body);
      String location = data['name'] ?? '';
      double temp = data['main']['temp'].toDouble();
      String description = data['weather'][0]['description'];
      double windSpeed = data['wind']['speed'].toDouble();
      double humidity = data['main']['humidity'].toDouble();

      log(windSpeed.toString());
      log(humidity.toString());
      await WeatherController.i.getTemperature(temp,description,windSpeed,humidity);
      log(description);
      log(location);
      log(temp.toString());
    }
    else if(response.statusCode == 401){
      log('${response.statusCode}');
    }
   }
   catch(e)
   {
    log(e.toString());
   }
  }
  getHourlyWeatherData(Position position)async
  {
    var url = 'https://api.openweathermap.org/data/2.5/forecast?lat=${position.latitude}&lon=${position.longitude}&appid=${APPConstants.apiKey}&units=metric&cnt=5';
    try{
     var response = await http.get(Uri.parse(url));
     log(response.body);
    if(response.statusCode == 200)
    {
      var data = jsonDecode(response.body);
      final hourlyList = data['list'];

      for(var i in hourlyList )
      {
        String date = i['dt_txt'];
        double temp = i['main']['temp'].toDouble();
        final description = i['weather'][0]['description'];
        log('The temperature at $date is : $temp');
        WeatherController.i.weatherData.add(WeatherModel(date: date,temp: temp,description: description));
      }

    }
    else if(response.statusCode == 401){
      log('${response.statusCode}');
    }
   }
   catch(e){
    log('Error caught here in weeklydata$e');
   }
  }

    getDailyWeatherData(Position position)async
  {
    var url = 'https://api.openweathermap.org/data/2.5/forecast?lat=${position.latitude}&lon=${position.longitude}&appid=${APPConstants.apiKey}&units=metric';
    try{
     var response = await http.get(Uri.parse(url));
     log(response.body);
    if(response.statusCode == 200)
    {
      var data = jsonDecode(response.body);
      final hourlyList = data['list'];

      for(var i in hourlyList )
      {
        String date = i['dt_txt'];
        double temp = i['main']['temp'];
        String description = i['weather'][0]['description'];
        int humidity = i['main']['humidity'];
        double windSpeed = i['wind']['speed'].toDouble();
        // ignore: prefer_interpolation_to_compose_strings
        String icon = "${"http://openweathermap.org/img/w/" + i['weather'][0]['icon']}.png";
        
        log('The temperature at $date is : $temp');
        if(date.split(' ').last == '00:00:00')
        {
          WeatherController.i.weeklyWeatherData.add(WeatherModel(date: date,temp: temp, description:  description, icon: icon, humidity: humidity,windspeed: windSpeed));
        }
      }
       log('The daily weatherList is ${WeatherController.i.weeklyWeatherData.toString()}');
    }
    else if(response.statusCode == 401){
      log('${response.statusCode}');
    }
   }
   catch(e){
    log('Error caught here in this part $e');
   }
  }
    
 }