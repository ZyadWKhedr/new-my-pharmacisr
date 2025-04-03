import '../entities/emergency_contact_entity.dart';

abstract class EmergencyRepository {
  Future<List<EmergencyContactEntity>> getEmergencyContacts();
}