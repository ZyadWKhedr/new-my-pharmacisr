import 'dart:math';
import 'package:new_my_pharmacist/features/home/data/datasources/health_tip_remote_datasource.dart';
import 'package:new_my_pharmacist/features/home/domain/entities/health_tip_entity.dart';
import 'package:new_my_pharmacist/features/home/domain/repositories/health_tip_repository.dart';

class HealthTipRepositoryImpl implements HealthTipRepository {
  final HealthTipRemoteDataSource remoteDataSource;

  HealthTipRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<HealthTipEntity>> fetchAllHealthTips() async {
    return await remoteDataSource.fetchAllHealthTips();
  }

  @override
  List<HealthTipEntity> getRandomTips(List<HealthTipEntity> allTips, {required int count}) {
    if (allTips.isEmpty) return [];
    
    // Create new Random instance without seed for true randomness
    final random = Random();
    
    // Make sure we don't try to take more items than available
    final effectiveCount = count > allTips.length ? allTips.length : count;
    final shuffled = List.of(allTips)..shuffle(random);
    return shuffled.take(effectiveCount).toList();
  }

  // Kept for backward compatibility
  @override
  Future<List<HealthTipEntity>> fetchDailyTips({required int count}) async {
    final allTips = await fetchAllHealthTips();
    return getRandomTips(allTips, count: count);
  }
}