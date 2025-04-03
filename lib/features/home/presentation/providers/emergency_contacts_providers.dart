import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_my_pharmacist/features/home/data/datasources/emergency_remote_datasource.dart';
import 'package:new_my_pharmacist/features/home/data/repositories/emergency_repository_impl.dart';
import 'package:new_my_pharmacist/features/home/domain/entities/emergency_contact_entity.dart';
import 'package:new_my_pharmacist/features/home/domain/repositories/emergency_repository.dart';

final emergencyRemoteDataSourceProvider = Provider<EmergencyRemoteDataSource>((
  ref,
) {
  return EmergencyRemoteDataSource();
});

// Repository Provider
final emergencyRepositoryProvider = Provider<EmergencyRepository>((ref) {
  return EmergencyRepositoryImpl(ref.read(emergencyRemoteDataSourceProvider));
});

// Main Provider
final emergencyContactsProvider = FutureProvider<List<EmergencyContactEntity>>((
  ref,
) async {
  final repository = ref.read(emergencyRepositoryProvider);
  return await repository.getEmergencyContacts();
});
