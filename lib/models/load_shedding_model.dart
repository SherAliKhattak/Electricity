import 'package:electricity/models/load_shedding_data_model.dart';

class Loadshedding {
  bool? success;
  List<LoadsheddingDataModel>? data;
  String? message;
  
  Loadshedding({this.success, this.data, this.message});

  Loadshedding.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <LoadsheddingDataModel>[];
      json['data'].forEach((v) {
        data!.add( LoadsheddingDataModel.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}