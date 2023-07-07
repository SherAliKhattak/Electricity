import 'dart:developer';
import 'package:electricity/models/load_shedding_data_model.dart';
import 'package:electricity/models/load_shedding_model.dart';
import 'package:electricity/models/towns_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../models/districts_data_model.dart';
import '../../models/districts_model.dart';
import '../../models/feeders_model.dart';
import '../repos/grid_info_repo.dart';

class GridInfoController extends GetxController implements GetxService {
  List<Districts> districts = [];
  List<Feeders> feeders = [];
  List<Towns> towns = [];
  List<Feeders> tempfeedersList = [];
  List<Towns> tempTownsList = [];

  Duration? todayHousr;

  static DateTime today = DateTime.now();
  String formattedDate = DateFormat('yyyy-MM-dd').format(today);
  String formattedDay = DateFormat('EEEE').format(today);

  Duration? dailyHours;
  Duration? weeklyHours;
  Duration? monthlyHours;

  String? district;
  String? feeder;
  String? town;

  Duration yearlyDuration = Duration.zero;

  static DateTime now = DateTime.now();
  DateTime nextWeek = now.add(const Duration(days: 7));
  DateTime nextMonth = now.add(const Duration(days: 30));
  DateTime nextyear = now.add(const Duration(days: 365));

  String? feederName;
  String? districtName;
  String? townName;

List<LoadsheddingDataModel> todayData = [];
List<LoadsheddingDataModel> dailyData = [];
Map<String, List<LoadsheddingDataModel>> weeklyData = {
  "Sunday": [],
  "Monday": [],
  "Tuesday": [],
  "Wednesday": [],
  "Thursday": [],
  "Friday": [],
  "Saturday": []
};
Map<String, List<LoadsheddingDataModel>> filteredWeekData = {
 
};
Map<int, List<LoadsheddingDataModel>> monthlyData = {};
Map<int, List<LoadsheddingDataModel>> yearlyData = {};


  populateDropdown() async {
    DistrictsData districtsdata = await GridInfoRepo().getDistrictsData();
    districts = districtsdata.data!;
    for (var district in districts) {
      feeders.addAll(district.feeders!.toList());
      log(GridInfoController.i.feeders.toString());
    }
    for (var feeder in feeders) {
      towns.addAll(feeder.towns!.toList());
    }
    update();
  }

  updateDistrict(String value) {
    feeder = null;
    town = null;
    district = value.toString();
    tempfeedersList = feeders
        .where(
            (element) => element.districtId.toString() == district.toString())
        .toList();
    update();
  }

  updateFeeder(String value) {
    feeder = value.toString();
    town = null;
    tempTownsList = towns
        .where((element) => element.feederId.toString() == feeder.toString())
        .toList();
    update();
  }

  updateTown(String value) {
    town = value.toString();
    update();
  }

  searchData() async {

    Loadshedding? loadshedding  = await GridInfoRepo().searchDistrictsData();
    List<LoadsheddingDataModel> data = loadshedding!.data!;

    for (var i in data) {
  DateTime start = i.startTime!;
  DateTime end = i.endTime!;

  Duration duration = end.difference(start);

  log('${start.toString().split(' ').first}.........$formattedDate');
  
  // today Data
  if(start.toString().split(' ').first == formattedDate)
  {
    todayData.add(LoadsheddingDataModel(
      startTime: start,endTime: end, duration: duration
    ));
  }

  // Daily data
  if (duration.inDays == 0) {
    dailyData.add(
      LoadsheddingDataModel(
        startTime: start,
        endTime: end,
        duration: duration

      )
    );
  }

  // Weekly data
  if (duration.inDays < 7) {
    String dayOfWeek = DateFormat('EEEE').format(start);
    log('dayOfWeek :$dayOfWeek');
    weeklyData[dayOfWeek]!.add(
      LoadsheddingDataModel(
        startTime: start,
        endTime: end,
        duration: duration
      )
    );
    filteredWeekData.addIf(weeklyData[dayOfWeek]!.isNotEmpty, dayOfWeek,weeklyData[dayOfWeek]!);
    log('${filteredWeekData.toString()}.......filtered');
    log('${filteredWeekData.length}.......filtered');
  }
  int month = start.month;
  if (!monthlyData.containsKey(month)) {
    monthlyData[month]?.add(
      LoadsheddingDataModel(
        startTime: start,
        endTime: end,
        duration: duration
      )
    );
  } else {
  
  }

  // Yearly data
  int year = start.year;
  if (yearlyData.containsKey(year)) {
    yearlyData[year]!.add(
      LoadsheddingDataModel(
        startTime: start,
        endTime: end,
        duration: duration
      )
    );
  } else {
    yearlyData[year] = [
      LoadsheddingDataModel(
        startTime: start,
        endTime: end,
        duration: duration
      )
    ];
  }
  log('daily Data is $dailyData');
  log('weekly Data is $weeklyData');
  log('monthly Data is $monthlyData');

}update();
  }

  Duration calculateTotalDuration(Map<dynamic, List<LoadsheddingDataModel>> data) {
  Duration totalDuration = Duration.zero;
  for (var events in data.values) {
    Duration monthlyDuration = events.fold(Duration.zero, (prev, curr) => prev + curr.duration!);
    totalDuration += monthlyDuration;
  }
  return totalDuration;
}

Duration addDurationToList(List<LoadsheddingDataModel> list) {
  Duration totalDuration = Duration.zero;
  for (var i = 0; i < list.length; i++) {
    LoadsheddingDataModel data = list[i];
    Duration duration = data.endTime!.difference(data.startTime!);
    totalDuration += duration;
  }
  return totalDuration;
}

  static GridInfoController get i => Get.put(GridInfoController());
}
