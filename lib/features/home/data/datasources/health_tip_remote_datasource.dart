import 'package:new_my_pharmacist/features/home/data/models/health_tip_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HealthTipRemoteDataSource {
  final SupabaseClient _client;

  HealthTipRemoteDataSource() : _client = Supabase.instance.client;

  Future<List<HealthTipModel>> fetchAllHealthTips() async {
    try {
      final response = await _client
          .from('health_tips')
          .select('*')
          .order('created_at', ascending: false);
      
      return response
          .map((json) => HealthTipModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch health tips: $e');
    }
  }
}