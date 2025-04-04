import 'package:new_my_pharmacist/features/medicines/domain/entities/medicine.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MedicineRemoteDataSource {
  final SupabaseClient _client;

  // Column names as constants
  static const _table = 'medicines';
  static const _colId = 'id';
  static const _colName = 'Medicine Name';
  static const _colComposition = 'Composition';
  static const _colUses = 'Uses';
  static const _colSideEffects = 'Side_effects';
  static const _colImageUrl = 'Image URL';
  static const _colManufacturer = 'Manufacturer';

  MedicineRemoteDataSource() : _client = Supabase.instance.client;

  // Mapper function to avoid repetition
  Medicine _mapJsonToMedicine(Map<String, dynamic> json) {
    return Medicine(
      id: json[_colId],
      name: json[_colName] ?? 'Unknown',
      composition: json[_colComposition] ?? '',
      uses: json[_colUses] ?? '',
      sideEffects: json[_colSideEffects] ?? '',
      imageUrl: json[_colImageUrl] ?? '',
      manufacturer: json[_colManufacturer] ?? '',
    );
  }

  Future<List<Medicine>> fetchMedicines() async {
    try {
      final response = await _client.from(_table).select('*');

      print('Supabase medicines response: $response');

      // Optional debug: print first record keys
      if (response.isNotEmpty) {
        print('First record keys: ${response.first.keys.toList()}');
      }

      return response.map(_mapJsonToMedicine).toList();
    } catch (e) {
      print('Error fetching medicines: $e');
      throw Exception('Failed to fetch medicines: $e');
    }
  }

  Future<List<Medicine>> searchMedicines(String query) async {
    try {
      if (query.trim().isEmpty) {
        // If the query is empty, return all medicines
        return fetchMedicines();
      }

      final response = await _client
          .from(_table)
          .select('*')
          .ilike(_colName, '%$query%')
          .timeout(const Duration(seconds: 10)); // Timeout protection

      return response.map(_mapJsonToMedicine).toList();
    } catch (e) {
      print('Error searching medicines: $e');
      throw Exception('Failed to search medicines: $e');
    }
  }
}
