class AuthValidatorHelper {
  /// Validates an email address.
  /// Returns an error message if the email is invalid, otherwise returns null.
  static String? validateEmail(String email) {
    if (email.isEmpty) {
      return 'Email cannot be empty';
    }

    // Regular expression to validate email format
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
    );
    if (!emailRegex.hasMatch(email)) {
      return 'Enter a valid email address';
    }

    return null; // Email is valid
  }

  /// Validates a password.
  /// Returns an error message if the password does not meet requirements, otherwise returns null.
  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Password cannot be empty';
    }

    // Password length requirement
    if (password.length < 6) {
      return 'Password must be at least 6 characters long';
    }

    // Strong password requirement: at least one uppercase, one lowercase, and one number
    final strongPasswordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{6,}$',
    );
    if (!strongPasswordRegex.hasMatch(password)) {
      return 'Password must contain at least one uppercase letter, one lowercase letter, and one number';
    }

    return null; // Password is valid
  }
}
