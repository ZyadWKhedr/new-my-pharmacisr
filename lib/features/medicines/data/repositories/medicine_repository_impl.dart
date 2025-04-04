import 'package:new_my_pharmacist/features/medicines/data/data_sources/local_db.dart';
import 'package:new_my_pharmacist/features/medicines/data/data_sources/medicine_data_source.dart';
import '../../domain/entities/medicine.dart';
import '../../domain/repositories/medicine_repository.dart';


class MedicineRepositoryImpl implements MedicineRepository {
  final MedicineRemoteDataSource remote;
  final SQLiteService local;

  MedicineRepositoryImpl(this.remote, this.local);

  @override
  Future<List<Medicine>> getAllMedicines() {
    return remote.fetchMedicines();
  }

  @override
  Future<List<Medicine>> searchMedicines(String query) async {
    final all = await remote.fetchMedicines();
    return all.where((m) =>
      m.name.toLowerCase().contains(query.toLowerCase()) ||
      m.uses.toLowerCase().contains(query.toLowerCase())
    ).toList();
  }

  @override
  Future<void> addToFavorites(Medicine medicine) {
    return local.addFavorite(medicine);
  }

  @override
  Future<List<Medicine>> getFavorites() {
    return local.getFavorites();
  }

  @override
  Future<void> addReminder(String name, String time) {
    return local.addReminder(name, time);
  }

  @override
  Future<List<Map<String, dynamic>>> getReminders() {
    return local.getReminders();
  }
}
