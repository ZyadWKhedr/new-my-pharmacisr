import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  final SharedPreferences prefs;

  LocalDataSource({required this.prefs});

  Future saveToken(String token) async {
    await prefs.setString('user_token', token);
  }

   String? getToken() {
    return prefs.getString('user_token');
  }

  Future<void> removeToken() async {
    await prefs.remove('user_token');
  }
  
}
