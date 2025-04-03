import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/emergency_contact_model.dart';

class EmergencyRemoteDataSource {
  final _client = Supabase.instance.client;

  Future<List<EmergencyContactModel>> fetchEmergencyContacts() async {
    try {
      final response = await _client
          .from('emergency_contacts')
          .select()
          .eq('country', 'Egypt')
          .order('category');

      return response
          .map((contact) => EmergencyContactModel.fromJson(contact))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch emergency contacts: $e');
    }
  }
}