
import 'feeders_model.dart';

class Districts {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  List<Feeders>? feeders;

  Districts({this.id, this.name, this.createdAt, this.updatedAt, this.feeders});

  Districts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['feeders'] != null) {
      feeders = <Feeders>[];
      json['feeders'].forEach((v) {
        feeders!.add(Feeders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (feeders != null) {
      data['feeders'] = feeders!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  void forEach(Null Function(dynamic feeder) param0) {}
}
