import 'package:electricity/utils/home_screen_utils/home_screen_utils.dart';

class LoadsheddingDataModel {
  String? district;
  String? feeder;
  String? town;
  DateTime? startTime;
  DateTime? endTime;
  Duration? duration;

  LoadsheddingDataModel({this.district, this.feeder, this.town, this.startTime, this.endTime, this.duration});
  
  LoadsheddingDataModel.fromJson(Map<String, dynamic> json) {
    district = json['district'];
    feeder = json['feeder'];
    town = json['town'];
    startTime = HomeScreenUtils().toDateTime(json['start_time']);
    endTime = HomeScreenUtils().toDateTime(json['end_time']);
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['district'] =  district;
    data['feeder'] = feeder;
    data['town'] = town;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['duration'] = duration;
    return data;
  }


}
