import 'package:electricity/data/controllers/weather_controller.dart';
import 'package:electricity/models/weather_model.dart';
import 'package:electricity/ui/common/images.dart';
import 'package:electricity/ui/dashboard/weather/week_weather.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/weather_screen_repo/weather_screen_utils.dart';
import '../../common/colors.dart';
import '../../common/weather_data_card.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblackColor,
      body: GetBuilder<WeatherController>(builder: (contr) {
        return Column(
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [kprimaryColor1, Color(0xff00aafc)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(Images.location),
                            SizedBox(
                              width: Get.width * .012,
                            ),
                            Text(
                              '${contr.country}',
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: ksecondaryColor,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        Expanded(
                          child: Image.asset(
                            Images.wcloud,
                          ),
                        ),
                        Text(
                          '${WeatherScreenUtils().displayTemperature()}\u00b0',
                          style: const TextStyle(
                              fontSize: 100,
                              color: ksecondaryColor,
                              fontWeight: FontWeight.w600),
                        ),
                        Text('${WeatherScreenUtils().displayDescription()}',
                            style: const TextStyle(
                                fontSize: 24,
                                color: ksecondaryColor,
                                fontWeight: FontWeight.w400)),
                         Text(
                          contr.formattedDate,
                          style: const TextStyle(fontSize: 11, color: kblack54Color),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Divider(
                            thickness: 1,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            WeatherDataCard(
                              image: Images.wind,
                              title: 'wind'.tr,
                              value: '${contr.windSpeed}km/h',
                            ),
                            WeatherDataCard(
                                value: '${contr.currentHumidity}%',
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                    'today'.tr,
                    style: const TextStyle(fontSize: 20, color: ksecondaryColor),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(const WeekWeatherScreen());
                    },
                    child: const Text(
                      '7 Days >',
                      style: TextStyle(fontSize: 12, color: ksecondaryColor),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: Get.height*0.13,
              child: GetBuilder<WeatherController>(
               
                builder: (contr) {
                  return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const VerticalDivider(),
                      shrinkWrap: true,
                      itemCount: contr.weatherData.length,
                      itemBuilder: (context, index) {
                        final list = contr.weatherData[index];
                        return GestureDetector(
                            onTap: () {
                              contr.updateIndex(index);
                            },
                            child: DayDataWeatherCard(
                              list: list,
                              index: index,
                              corlor: contr.selectedindex == index
                                  ? kprimaryColor1
                                  : Colors.black,
                              height: contr.selectedindex == index
                                  ? Get.height * .2
                                  : Get.height * .1,
                            ));
                      });
                }
              ),
            )
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     const DayDataWeatherCard(),
            //     DayDataWeatherCard(
            //       height: Get.height * .11,
            //       corlor: kprimaryColor1,
            //     ),
            //     const DayDataWeatherCard(),
            //     const DayDataWeatherCard()
            //   ],
            // )
          ],
        );
      }),
    );
  }
}

class DayDataWeatherCard extends StatelessWidget {
  final WeatherModel list;
  final int? index;
  final Color? corlor;
  final double? height;
  const DayDataWeatherCard({
    Key? key,
    this.corlor,
    this.height,
    this.index, required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * .18,
      decoration: BoxDecoration(
          color: corlor,
          border: Border.all(color: ksecondaryColor),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Text(
            '${list.temp}\u00b0',
            style: const TextStyle(
                color: ksecondaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          Image.asset(Images.lightning,color: Colors.yellow,),
          Text(
            list.date!.split(' ').last,
            style: const TextStyle(
                color: ksecondaryColor,
                fontSize: 12,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
