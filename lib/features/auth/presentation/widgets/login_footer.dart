import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:new_my_pharmacist/core/helpers/toast_helper.dart';
import 'package:new_my_pharmacist/core/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_my_pharmacist/features/auth/presentation/providers/forgot_password_provider.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth for error handling

class LoginFooter extends ConsumerWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forgotPasswordUseCase = ref.read(forgotPasswordUseCaseProvider);

    Future<void> _handleForgotPassword(BuildContext context) async {
      final TextEditingController emailController = TextEditingController();

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Enter your email',
              style: TextStyle(color: Colors.black),
            ),
            content: TextField(
              controller: emailController,
              style: const TextStyle(
                color: Colors.black,
              ), // Set text color to black
              decoration: const InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.blueGrey),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () async {
                  String email = emailController.text.trim();
                  if (email.isEmpty) {
                    // Show a toast message instead of using ScaffoldMessenger
                    ToastHelper.showToast(
                      'Please enter a valid email.',
                      textColor: Colors.white,
                    );
                    return;
                  }

                  try {
                    // Try to send the reset password email
                    await forgotPasswordUseCase(email);
                    // Show success toast
                    ToastHelper.showToast(
                      'Password reset email sent!',
                      textColor: Colors.white,
                    );
                    Navigator.of(context).pop(); // Close the dialog
                  } on FirebaseAuthException catch (e) {
                    // Handle Firebase specific errors
                    if (e.code == 'user-not-found') {
                      // User not found
                      ToastHelper.showToast(
                        'No user found with this email.',
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                      );
                    } else {
                      // Other errors
                      ToastHelper.showToast(
                        'Error: ${e.message}',
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                      );
                    }
                  } catch (e) {
                    // General error fallback
                    ToastHelper.showToast(
                      'Error: $e',
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          );
        },
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => _handleForgotPassword(context),
          child: Text(
            'Forgot password?',
            style: TextStyle(
              fontSize: 12.sp,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        SizedBox(width: 120.w),
        GestureDetector(
          onTap: () {
            context.pushReplacement(AppRoutes.signup);
          },
          child: Text('Have an account?', style: TextStyle(fontSize: 14.sp)),
        ),
      ],
    );
  }
}
