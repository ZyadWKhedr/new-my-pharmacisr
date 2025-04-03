import 'package:new_my_pharmacist/features/home/domain/entities/health_tip_entity.dart';

abstract class HealthTipRepository {
  Future<List<HealthTipEntity>> fetchAllHealthTips();
  Future<List<HealthTipEntity>> fetchDailyTips({required int count});
}