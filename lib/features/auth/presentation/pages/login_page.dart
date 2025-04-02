import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_my_pharmacist/core/consts/colors.dart';
import 'package:new_my_pharmacist/core/helpers/auth_error_helper.dart';
import 'package:new_my_pharmacist/core/helpers/toast_helper.dart';
import 'package:new_my_pharmacist/core/helpers/auth_validator_helper.dart';
import 'package:new_my_pharmacist/features/auth/presentation/widgets/custom_button.dart';
import 'package:new_my_pharmacist/features/auth/presentation/widgets/custom_row.dart';
import 'package:new_my_pharmacist/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:new_my_pharmacist/features/auth/providers/auth_provider.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final authService = ref.read(authServiceProvider);

    final emailError = AuthValidatorHelper.validateEmail(email);
    final passwordError = AuthValidatorHelper.validatePassword(password);

    if (emailError != null) {
      ToastHelper.showToast(emailError);
      return;
    }
    if (passwordError != null) {
      ToastHelper.showToast(passwordError);
      return;
    }

    setState(() => _isLoading = true);

    try {
      await authService.signIn(email, password);
      ToastHelper.showToast('Login successful!');
      // Navigate to HomePage after successful login
    } catch (e) {
      final errorMessage = AuthErrorHandler.getErrorMessage(e as Exception);
      ToastHelper.showToast(errorMessage);
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(), // Dismiss keyboard
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: double.infinity,
              height: 470.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(70)),
                color: AppColors.primaryColor,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    SizedBox(height: 40.h),
                    _buildTitle(),
                    SizedBox(height: 10.h),
                    _buildLabel('Email'),
                    CustomTextFormField(
                      controller: _emailController,
                      hintText: 'johnDoe@gmail.com',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 10.h),
                    _buildLabel('Password'),
                    CustomTextFormField(
                      controller: _passwordController,
                      hintText: '********',
                      isPassword: true,
                    ),
                    SizedBox(height: 30.h),
                    _isLoading
                        ? CircularProgressIndicator(color: Colors.white)
                        : CustomButton(text: 'Login', onPressed: _signIn),
                    SizedBox(height: 15.h),
                    const CustomRow(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Column(
      children: [
        Text(
          'Login',
          style: TextStyle(
            color: AppColors.textPrimaryColor,
            fontSize: 40.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Sign in to continue',
          style: TextStyle(
            color: AppColors.textSecondaryColor,
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildLabel(String text) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.textPrimaryColor,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
