import 'package:firebase_auth/firebase_auth.dart';

class AuthErrorHandler {
  static String getErrorMessage(Exception e) {
    if (e is FirebaseAuthException) {
      switch (e.code) {
        case 'invalid-email':
          return 'Invalid email format.';
        case 'user-disabled':
          return 'This user has been disabled.';
        case 'user-not-found':
          return 'No user found with this email.';
        case 'wrong-password':
          return 'Incorrect password. Please try again.';
        case 'email-already-in-use':
          return 'This email is already registered. Please log in.';
        case 'weak-password':
          return 'Password should be at least 6 characters.';
        case 'too-many-requests':
          return 'Too many attempts. Try again later.';
        case 'network-request-failed':
          return 'Network error. Please check your connection.';
        default:
          return 'Authentication failed. Please try again.';
      }
    }
    return 'An unexpected error occurred.';
  }

  static String getSuccessMessage(String action) {
    switch (action) {
      case 'signup':
        return 'Registration successful!';
      case 'login':
        return 'Login successful!';
      case 'password-reset':
        return 'Password reset email sent!';
      default:
        return 'Action completed successfully!';
    }
  }
}
