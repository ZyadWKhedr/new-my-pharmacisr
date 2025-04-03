import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_my_pharmacist/features/home/data/datasources/health_tip_remote_datasource.dart';
import 'package:new_my_pharmacist/features/home/data/repositories/health_tips_repository_impl.dart';
import 'package:new_my_pharmacist/features/home/domain/entities/health_tip_entity.dart';
import 'package:new_my_pharmacist/features/home/domain/repositories/health_tip_repository.dart';

// 1. Remote Data Source Provider
final healthTipRemoteDataSourceProvider = Provider<HealthTipRemoteDataSource>((
  ref,
) {
  return HealthTipRemoteDataSource();
});

// 2. Repository Provider
final healthTipRepositoryProvider = Provider<HealthTipRepository>((ref) {
  final remoteDataSource = ref.read(healthTipRemoteDataSourceProvider);
  return HealthTipRepositoryImpl(remoteDataSource: remoteDataSource);
});

// 3. Random Tips Provider (refreshes each time)
final randomHealthTipsProvider =
    FutureProvider.autoDispose<List<HealthTipEntity>>((ref) async {
      final repository = ref.read(healthTipRepositoryProvider);
      return repository.fetchDailyTips(count: 4);
    });

// 4. All Tips Provider
final allHealthTipsProvider = FutureProvider<List<HealthTipEntity>>((
  ref,
) async {
  final repository = ref.read(healthTipRepositoryProvider);
  return repository.fetchAllHealthTips();
});
