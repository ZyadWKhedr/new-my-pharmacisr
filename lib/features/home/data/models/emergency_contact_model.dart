import '../../domain/entities/emergency_contact_entity.dart';

class EmergencyContactModel extends EmergencyContactEntity {
  EmergencyContactModel({
    required super.id,
    required super.name,
    required super.phone,
    required super.category,
    required super.icon,
  });

  factory EmergencyContactModel.fromJson(Map<String, dynamic> json) {
    return EmergencyContactModel(
      id: json['id'].toString(),
      name: json['name'] as String? ?? 'Unknown Service',
      phone: json['phone'] as String? ?? '',
      category: json['category'] as String? ?? 'General',
      icon: json['icon'] as String? ?? 'help',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'category': category,
      'icon': icon,
    };
  }
}