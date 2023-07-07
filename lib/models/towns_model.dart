class Towns {
  int? id;
  String? name;
  int? feederId;
  String? createdAt;
  String? updatedAt;

  Towns({this.id, this.name, this.feederId, this.createdAt, this.updatedAt});

  Towns.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    feederId = json['feeder_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['feeder_id'] = feederId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}