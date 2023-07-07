import 'package:electricity/data/controllers/grid_info_controller.dart';
import 'package:electricity/data/controllers/load_shedding_controller.dart';
import 'package:electricity/ui/dashboard/home/daily_list_view_builder.dart';
import 'package:electricity/ui/dashboard/home/monthly_list_view.dart';
import 'package:electricity/ui/dashboard/home/weekly_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/home_screen_utils/home_screen_utils.dart';
import '../../common/colors.dart';
import '../../common/images.dart';

String dropdownValue = list[0];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                      suffixIcon: Image.asset(Images.filter),
                      prefixIcon: Image.asset(Images.search),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: kblack54Color, width: 1),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: kblack54Color, width: 1),
                      )),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  height: Get.height * .15,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: const LinearGradient(
                          colors: [kprimaryColor1, Color(0xff00aafc)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                  child: GetBuilder<GridInfoController>(
                    
                    builder: (contr) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Text(
                                'feederInformation'.tr,
                                style: const TextStyle(
                                    color: ksecondaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                              Image.asset(
                                Images.lightning,
                                color: kprimaryColor,
                              ),
                            ],
                          ),
                          GetBuilder<GridInfoController>(builder: (contr) {
                            return Text('070394-${contr.feederName}',
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400));
                          }),
                           Text('132 KV ${contr.districtName}',
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Text('132 KV ${contr.townName}',
                                  style: const TextStyle(
                                      fontSize: 12, fontWeight: FontWeight.w400)),
                              DecoratedBox(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: kredColor),
                                child:  Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 2),
                                  child: Text(
                                    'off'.tr,
                                    style: const TextStyle(
                                        color: ksecondaryColor,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      );
                    }
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: kprimaryColor1),
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Text('loadsheddingSchedule'.tr,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                          Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: kprimaryColor1)),
                              child: SizedBox(
                                height: Get.height * .03,
                                child: DropdownButton<String>(
                                  value: dropdownValue,
                                  icon: const Icon(Icons.arrow_drop_down),
                                  underline: const SizedBox(),
                                  onChanged: (String? value) {
                                    setState(() {
                                      dropdownValue = value!;
                                    });
                                  },
                                  items: list.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ))
                        ],
                      ),
                      Text(
                        GridInfoController.i.formattedDate,
                        style: const TextStyle(
                            color: kblack45Color,
                            fontSize: 10,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        GridInfoController.i.formattedDay,
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: kprimaryColor1),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Text(
                            'totalBreakDowns'.tr,
                            style: const TextStyle(fontSize: 10),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2.5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: kprimaryColor1)),
                            child: Text(
                              '${totalBreakdowns().inHours} hours',
                              style: const TextStyle(
                                  color: kredColor,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                      dropdownValue == list[0]
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:  [
                                Text(
                                  'effectedTime'.tr,
                                  style: const TextStyle(fontSize: 14),
                                ),
                               const  Text(
                                  'Duration',
                                  style: TextStyle(fontSize: 14),
                                )
                              ],
                            )
                          : dropdownValue == list[1]
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children:  [
                                    Text(
                                      'days'.tr,
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                     Text(
                                      'duration'.tr,
                                      style: const TextStyle(fontSize: 14),
                                    )
                                  ],
                                )
                              : dropdownValue == list[2]
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          'Weeks',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        Text(
                                          'Duration',
                                          style: TextStyle(fontSize: 14),
                                        )
                                      ],
                                    )
                                  : dropdownValue == list[3]
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children:  [
                                            Text(
                                              'months'.tr,
                                              style: const TextStyle(fontSize: 14),
                                            ),
                                            Text(
                                              'duration'.tr,
                                              style: const TextStyle(fontSize: 14),
                                            )
                                          ],
                                        )
                                      : const SizedBox(),
                      dropdownValue.toLowerCase() == list[0].toLowerCase()
                          ? GetBuilder<LoadsheddingController>(
                              builder: (contr) {
                              return GetBuilder<GridInfoController>(
                                  builder: (cont) {
                                return ListView.builder(
                                    itemCount: cont.todayData.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      final list = cont.todayData[index];

                                      return TimeSlotsCard(
                                        startTime: list.startTime,
                                        endTime: list.endTime,
                                        duration: list.duration,
                                        
                                      );
                                    });
                              });
                            })
                          : dropdownValue.toLowerCase() == list[1].toLowerCase()
                              ? const DailyListviewBuilder()
                              : dropdownValue.toLowerCase() ==
                                      list[2].toLowerCase()
                                  ? const WeeklyListViewBuilder()
                                  : const MonthlyListView()
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: kprimaryColor1)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                       Text(
                        'changesInSchedule'.tr,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: Get.height * .005,
                      ),
                       Text(
                        'effectedFromNextMonth'.tr,
                        style: const TextStyle(fontSize: 10, color: kblack54Color),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(color: kprimaryColor1)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  '01:30 AM - 02:00 AM',
                                  style: TextStyle(
                                      fontSize: 10, color: kprimaryColor1),
                                ),
                                Text(
                                  '30 mins',
                                  style:
                                      TextStyle(fontSize: 10, color: kredColor),
                                )
                              ],
                            ),
                            Image.asset(Images.shuffle),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  '01:30 AM - 02:00 AM',
                                  style: TextStyle(
                                      fontSize: 10, color: kprimaryColor1),
                                ),
                                Text(
                                  '30 mins',
                                  style:
                                      TextStyle(fontSize: 10, color: kredColor),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TimeSlotsCard extends StatelessWidget {
  final DateTime? startTime;
  final DateTime? endTime;
  final Duration? duration;
  final Color? color;
  const TimeSlotsCard({
    Key? key,
    this.color,
    this.startTime,
    this.endTime, this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
            border: Border.all(color: kprimaryColor1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${HomeScreenUtils.formatDateTime(startTime!)} - ${HomeScreenUtils.formatDateTime(endTime!)}',
              style: const TextStyle(fontSize: 10, color: kprimaryColor1),
            ),
            Text(
              '${duration!.inHours} hours',
              style: const TextStyle(fontSize: 10, color: kredColor),
            )
          ],
        ),
      ),
    );
  }
}

 List<String> list = <String>['Today'.tr, 'Daily'.tr, 'Weekly'.tr, 'Monthly'.tr];

Duration totalBreakdowns() {
  if (dropdownValue == list[0]) {
    return GridInfoController.i.todayHousr!;
  } else if (dropdownValue == list[1]) {
    return GridInfoController.i.dailyHours!;
  } else if (dropdownValue == list[2]) {
    return GridInfoController.i.weeklyHours!;
  } else {
    return GridInfoController.i.monthlyHours!;
  }
}
