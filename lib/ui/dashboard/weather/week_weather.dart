import 'package:electricity/data/controllers/weather_controller.dart';
import 'package:electricity/ui/common/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/weather_model.dart';
import '../../../utils/home_screen_utils/home_screen_utils.dart';
import '../../common/colors.dart';
import '../../common/weather_data_card.dart';

class WeekWeatherScreen extends StatelessWidget {
  const WeekWeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblackColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Get.height * .5,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [kprimaryColor1, Color(0xff00aafc)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.keyboard_arrow_left,
                              size: 33,
                              color: ksecondaryColor,
                            )),
                        const Text(
                          "7 Days",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: ksecondaryColor),
                        ),
                        SizedBox(
                          width: Get.width * .1,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(Images.lightning),
                        RichText(
                          textAlign: TextAlign.center,
                            text:  TextSpan(children: [
                         const  TextSpan(
                              text: 'Tomorrow\n',
                              style: TextStyle(
                                  color: ksecondaryColor, fontSize: 20)),
                          TextSpan(
                              text: '${WeatherController.i.weeklyWeatherData[0].temp!.toInt()}\n',
                              style: const TextStyle(
                                  fontSize: 70,
                                  color: ksecondaryColor,
                                  fontWeight: FontWeight.w600)),
                           TextSpan(
                            text: '${WeatherController.i.weeklyWeatherData[0].description}',
                            style: const TextStyle(fontSize: 10, color: kblack45Color),
                          )
                        ])),
                        
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Divider(
                        thickness: 1,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:  [
                        WeatherDataCard(
                          image: Images.wind,
                          title: 'wind'.tr,
                          value: '${WeatherController.i.weeklyWeatherData[0].windspeed} km/h',
                        ),
                         WeatherDataCard(
                            value: '${WeatherController.i.weeklyWeatherData[0].humidity}%',
                            title: 'humidity'.tr,
                            image: Images.humidity),
                       WeatherDataCard(
                            value: '60%',
                            title: 'chancesofRain'.tr,
                            image: Images.storm)
                      ],
                    )
                  ],
                ),
              ),
            ),
            ListView.builder(
              itemCount: WeatherController.i.weeklyWeatherData.length,
              shrinkWrap: true,
              itemBuilder: (context,index){
                final weekData = WeatherController.i.weeklyWeatherData[index];
              return  WeekDayDataCard(week: weekData,);
            })
          ],
        ),
      ),
    );
  }
}

class WeekDayDataCard extends StatelessWidget {
  final WeatherModel? week;
  const WeekDayDataCard({
    Key? key, this.week,
  }) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Text(
            HomeScreenUtils.formattoDay(HomeScreenUtils().toDateTime(week!.date)!),
            style: const TextStyle(fontSize: 16, color: ksecondaryColor),
          ),
           Row(
            children: [
              Image.network(week!.icon!),
              Text(
           week!.description! ,
            style: const TextStyle(fontSize: 16, color: ksecondaryColor),
          ),
          
            ],
           ),
          Text(
           week!.temp!.toString() ,
            style: const TextStyle(fontSize: 16, color: ksecondaryColor),
          ),
        ],
      ),
    );
  }
}
