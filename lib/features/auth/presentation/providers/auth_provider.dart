import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_my_pharmacist/core/utils/shared_prefrences_provider.dart'
    show sharedPreferencesProvider;
import 'package:new_my_pharmacist/features/auth/data/datasources/local_data_source.dart';
import 'package:new_my_pharmacist/features/auth/data/repositories/auth_repository.dart';
import 'package:new_my_pharmacist/features/auth/domain/entities/user_entity.dart';
import 'package:new_my_pharmacist/features/auth/domain/repositories/auth_repository.dart';

// Auth Service Provider
final authServiceProvider = Provider<AuthService>((ref) {
  final prefs = ref.read(sharedPreferencesProvider);
  final localDataSource = LocalDataSource(prefs: prefs);
  final authRepository = AuthRepositoryImpl(
    firebase_auth.FirebaseAuth.instance,
    localDataSource,
  );
  return AuthService(authRepository);
});

// Auth State Provider
final authStateProvider = StateProvider<UserEntity?>((ref) {
  // Initialize LocalDataSource directly here
  final prefs = ref.read(sharedPreferencesProvider);
  final localDataSource = LocalDataSource(prefs: prefs);

  // Get saved token from local storage
  final savedToken = localDataSource.getToken();

  // Get the current Firebase user
  final firebaseUser = firebase_auth.FirebaseAuth.instance.currentUser;

  // If the Firebase user exists, return it
  if (firebaseUser != null) {
    return UserEntity(id: firebaseUser.uid, email: firebaseUser.email ?? '');
  }
  // Otherwise, check if there's a saved token (indicating a previous session)
  else if (savedToken != null) {
    return UserEntity(id: savedToken, email: "");
  }

  return null; // No user found
});

class AuthService {
  final AuthRepository authRepository;

  AuthService(this.authRepository);

  Future<UserEntity> signUp(String email, String password) async {
    return await authRepository.signUp(email, password);
  }

  Future<UserEntity?> signIn(String email, String password) async {
    return await authRepository.signIn(email, password);
  }

  Future<void> signOut() async {
    await authRepository.signOut();
  }

  Future<void> forgotPassword(String email) async {
    await authRepository.forgotPassword(email);
  }
}
