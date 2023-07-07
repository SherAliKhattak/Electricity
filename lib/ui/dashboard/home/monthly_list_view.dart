import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../data/controllers/grid_info_controller.dart';
import '../../../models/load_shedding_data_model.dart';
import '../../common/colors.dart';


class MonthlyListView extends StatelessWidget {
  const MonthlyListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: GridInfoController.i.yearlyData.length,
      itemBuilder: (context,index){
         var dailyList = GridInfoController.i.yearlyData.keys.elementAt(index);
        List<LoadsheddingDataModel> values = GridInfoController.i.yearlyData[dailyList]!;
        return ListView.builder(
          itemCount: values.length,
          shrinkWrap: true,
          itemBuilder: (context,index){
            final val = values[index];
            return MonthLlyList(
                endTime: val.endTime,
                startTime: val.startTime,
                duration: val.duration,
                
              );
          });
           
        });
      
  }
}



class MonthLlyList extends StatelessWidget {
  final DateTime? startTime;
  final DateTime? endTime;
  final Duration? duration;
  final Color? color;
  const MonthLlyList({
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
              DateFormat('MMMM').format(startTime!),
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