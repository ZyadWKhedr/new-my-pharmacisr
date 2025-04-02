import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:new_my_pharmacist/core/helpers/auth_error_helper.dart';
import 'package:new_my_pharmacist/features/auth/data/datasources/local_data_source.dart';
import 'package:new_my_pharmacist/features/auth/domain/entities/user_entity.dart';
import 'package:new_my_pharmacist/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final firebase_auth.FirebaseAuth firebaseAuth;
  final LocalDataSource localDataSource;

  AuthRepositoryImpl(this.firebaseAuth, this.localDataSource);

  @override
  Future<UserEntity> signIn(String email, String password) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      if (user != null) {
        await localDataSource.saveToken(user.uid);
        return UserEntity(id: user.uid, email: user.email ?? '');
      } else {
        throw Exception("User not found");
      }
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw Exception(
        AuthErrorHandler.getErrorMessage(e),
      ); 
    }
  }

  @override
  Future<UserEntity> signUp(String email, String password) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      if (user != null) {
        await localDataSource.saveToken(user.uid);
        return UserEntity(id: user.uid, email: user.email ?? '');
      } else {
        throw Exception("User creation failed");
      }
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw Exception(
        AuthErrorHandler.getErrorMessage(e),
      ); 
    }
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
    await localDataSource.removeToken();
  }
}
