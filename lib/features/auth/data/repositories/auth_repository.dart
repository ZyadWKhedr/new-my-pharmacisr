import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_my_pharmacist/features/auth/data/datasources/local_data_source.dart';

class AuthRepository {
  final FirebaseAuth firebaseAuth;
  final LocalDataSource localDataSource;

  AuthRepository(this.firebaseAuth, this.localDataSource);
  
  Future<User?> signUp(String email, String password) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      await localDataSource.saveToken(userCredential.user?.uid ?? '');
      return userCredential.user;
    } catch (e) {
      throw Exception('Sign Up Failed');
    }
  }

  Future<User?> signIn(String email, String password) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      await localDataSource.saveToken(userCredential.user?.uid ?? '');
      return userCredential.user;
    } catch (e) {
      throw Exception('Sign In Failed');
    }
  }

   Future<void> signOut() async {
    await firebaseAuth.signOut();
    await localDataSource.removeToken();
  }
}

