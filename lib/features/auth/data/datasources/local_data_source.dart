import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  final SharedPreferences prefs;

  LocalDataSource({required this.prefs});

  // Save user token
  Future<void> saveToken(String token) async {
    await prefs.setString('user_token', token);
  }

  // Retrieve user token
  String? getToken() {
    return prefs.getString('user_token');
  }

  // Remove user token (sign-out)
  Future<void> removeToken() async {
    await prefs.remove('user_token');
  }
}
