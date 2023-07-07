
 import 'package:electricity/data/controllers/weather_controller.dart';


class WeatherScreenUtils{

  displayTemperature()
  {
    int selectedIndex = WeatherController.i.selectedindex;
    if(selectedIndex == 0)
    {
      return WeatherController.i.weatherData[selectedIndex].temp;
    }
    if(selectedIndex == 1)
    {
      return WeatherController.i.weatherData[selectedIndex].temp;
    }
    if(selectedIndex == 2)
    {
      return WeatherController.i.weatherData[selectedIndex].temp;
    }
    if(selectedIndex == 3)
    {
      return WeatherController.i.weatherData[selectedIndex].temp;
    }
    if(selectedIndex == 4)
    {
      return WeatherController.i.weatherData[selectedIndex].temp;
    }
  }
  displayDescription()
  {
    int selectedIndex = WeatherController.i.selectedindex;
    if(selectedIndex == 0)
    {
      return WeatherController.i.weatherData[selectedIndex].description;
    }
    if(selectedIndex == 1)
    {
      return WeatherController.i.weatherData[selectedIndex].description;
    }
    if(selectedIndex == 2)
    {
      return WeatherController.i.weatherData[selectedIndex].description;
    }
    if(selectedIndex == 3)
    {
      return WeatherController.i.weatherData[selectedIndex].description;
    }
    if(selectedIndex == 4)
    {
      return WeatherController.i.weatherData[selectedIndex].description;
    }
  }
  // String weatherImages(String weather){
  //   if(weather == 'scattered clouds')
  //   {
  //     return Images.clouds;
  //   }
    
  // }
}