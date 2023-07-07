import 'package:flutter/material.dart';

import '../../../data/controllers/grid_info_controller.dart';
import '../../../models/load_shedding_data_model.dart';
import '../../../utils/home_screen_utils/home_screen_utils.dart';
import '../../common/colors.dart';


class WeeklyListViewBuilder extends StatelessWidget {
  
  const WeeklyListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: GridInfoController.i.weeklyData.length,
      itemBuilder: (context,index){
        var dailyList = GridInfoController.i.weeklyData.keys.elementAt(index);
        List<LoadsheddingDataModel> values = GridInfoController.i.weeklyData[dailyList]!;

        return ListView.builder(
          itemCount: values.length,
          shrinkWrap: true,
          itemBuilder: (context,index){
            final val = values[index];
            return WeeklyListCard(endTime: val.endTime,startTime: val.startTime,duration: val.duration,);
          });
          
      
        });
    
  }
}



class WeeklyListCard extends StatelessWidget {
  final DateTime? startTime;
  final DateTime? endTime;
  final Color? color;
  final Duration? duration;
  const WeeklyListCard({
    Key? key,
    this.color, 
    this.startTime, 
    this.endTime, this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
            border: Border.all(color: kprimaryColor1)),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            Text(
              ' Week - ${HomeScreenUtils().getWeekOfMonth(startTime!).toString()}',
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