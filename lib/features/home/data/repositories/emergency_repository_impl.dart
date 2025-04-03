import 'package:new_my_pharmacist/features/home/data/datasources/emergency_remote_datasource.dart';
import '../../domain/repositories/emergency_repository.dart';
import '../../domain/entities/emergency_contact_entity.dart';

class EmergencyRepositoryImpl implements EmergencyRepository {
  final EmergencyRemoteDataSource remoteDataSource;

  EmergencyRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<EmergencyContactEntity>> getEmergencyContacts() async {
    try {
      final contacts = await remoteDataSource.fetchEmergencyContacts();
      return contacts.toList();
    } catch (e) {
      throw Exception('Failed to load emergency contacts: $e');
    }
  }
}