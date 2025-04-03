import 'package:new_my_pharmacist/features/home/domain/entities/health_tip_entity.dart';

class HealthTipModel extends HealthTipEntity {
  HealthTipModel({
    required super.id,
    required super.title,
    required super.iconName,
  });

  factory HealthTipModel.fromJson(Map<String, dynamic> json) {
    return HealthTipModel(
      id: json['id'],
      title: json['title'],
      iconName: json['icon_name'], 
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'icon_name': iconName};
  }
}
