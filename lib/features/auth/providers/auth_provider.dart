import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_my_pharmacist/core/utils/shared_prefrences_provider.dart';
import 'package:new_my_pharmacist/features/auth/data/datasources/local_data_source.dart';
import 'package:new_my_pharmacist/features/auth/data/repositories/auth_repository.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  final prefs = ref.read(sharedPreferencesProvider);
  final localDataSource = LocalDataSource(prefs: prefs);
  final authRepository = AuthRepository(FirebaseAuth.instance, localDataSource);
  return AuthService(authRepository);
});

class AuthService {
  final AuthRepository authRepository;
  AuthService(this.authRepository);

  Future<User?> signUp(String email, String password) async {
    return await authRepository.signUp(email, password);
  }

  Future<User?> signIn(String email, String password) async {
    return await authRepository.signIn(email, password);
  }

  Future<void> signOut() async {
    await authRepository.signOut();
  }
}
