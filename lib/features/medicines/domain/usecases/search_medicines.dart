import 'package:new_my_pharmacist/features/medicines/domain/entities/medicine.dart';
import '../repositories/medicine_repository.dart';

class SearchMedicines {
  final MedicineRepository repository;

  SearchMedicines(this.repository);

  Future<List<Medicine>> call(String query) {
    return repository.searchMedicines(query);
  }
}
