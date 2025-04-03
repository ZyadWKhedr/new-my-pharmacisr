// lib/features/emergency/domain/entities/emergency_contact_entity.dart
class EmergencyContactEntity {
  final String id;
  final String name;
  final String phone;
  final String category;
  final String icon;

  EmergencyContactEntity({
    required this.id,
    required this.name,
    required this.phone,
    required this.category,
    required this.icon,
  });
}