import 'package:flutter/material.dart';
import '../../../data/controllers/grid_info_controller.dart';
import '../../../models/load_shedding_data_model.dart';
import '../../../utils/home_screen_utils/home_screen_utils.dart';
import '../../common/colors.dart';

class DailyListviewBuilder extends StatelessWidget {
  const DailyListviewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: GridInfoController.i.dailyData.length,
        itemBuilder: (context, index) {
          var dailyList = GridInfoController.i.dailyData[index];
          return DailyListCard(
            startTime: dailyList.startTime,
            endTime: dailyList.endTime,
            duration: dailyList.duration,
          );
        });
  }
}

class DailyListCard extends StatelessWidget {
  final DateTime? startTime;
  final DateTime? endTime;
  final Duration? duration;
  final Color? color;
  const DailyListCard({
    Key? key,
    this.color,
    this.startTime,
    this.endTime,
    this.duration,
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
              HomeScreenUtils.formattoDay(startTime!),
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
