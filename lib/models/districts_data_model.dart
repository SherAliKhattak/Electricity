import 'districts_model.dart';

class DistrictsData {
  bool? success;
  List<Districts>? data;
  String? message;

  DistrictsData({this.success, this.data, this.message});

  DistrictsData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Districts>[];
      json['data'].forEach((v) {
        data!.add( Districts.fromJson(v));
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
