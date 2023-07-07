import 'package:electricity/models/towns_model.dart';

class Feeders {
  int? id;
  String? name;
  String? code;
  String? description;
  String? status;
  int? districtId;
  String? createdAt;
  String? updatedAt;
  List<Towns>? towns;

  Feeders(
      {this.id,
      this.name,
      this.code,
      this.description,
      this.status,
      this.districtId,
      this.createdAt,
      this.updatedAt,
      this.towns});

  Feeders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    description = json['description'];
    status = json['status'];
    districtId = json['district_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['towns'] != null) {
      towns = <Towns>[];
      json['towns'].forEach((v) {
        towns!.add(Towns.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    data['description'] = description;
    data['status'] = status;
    data['district_id'] = districtId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (towns != null) {
      data['towns'] = towns!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
