import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/data_sources/local_db.dart';
import '../../data/data_sources/medicine_data_source.dart';
import '../../data/repositories/medicine_repository_impl.dart';
import '../../domain/entities/medicine.dart';
import '../../domain/repositories/medicine_repository.dart';

// Repository
final medicineRepositoryProvider = Provider<MedicineRepository>((ref) {
  return MedicineRepositoryImpl(MedicineRemoteDataSource(), SQLiteService());
});

// Top 10
final topMedicinesProvider = FutureProvider<List<Medicine>>((ref) async {
  final all = await ref.read(medicineRepositoryProvider).getAllMedicines();
  return all.toList();
});

// Search
final medicineSearchProvider = FutureProvider.family<List<Medicine>, String>((
  ref,
  query,
) {
  return ref.read(medicineRepositoryProvider).searchMedicines(query);
});
// Local DB (SQLite)
final localDbProvider = Provider<SQLiteService>((ref) {
  return SQLiteService();
});
