import 'package:new_my_pharmacist/features/medicines/domain/entities/medicine.dart';

abstract class MedicineRepository {
  Future<List<Medicine>> getAllMedicines();
  Future<List<Medicine>> searchMedicines(String query);
  Future<void> addToFavorites(Medicine medicine);
  Future<List<Medicine>> getFavorites();
  Future<void> addReminder(String name, String time);
  Future<List<Map<String, dynamic>>> getReminders();
}
