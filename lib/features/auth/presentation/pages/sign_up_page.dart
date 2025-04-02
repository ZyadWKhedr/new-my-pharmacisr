import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:new_my_pharmacist/core/consts/colors.dart';
import 'package:new_my_pharmacist/core/helpers/auth_error_helper.dart';
import 'package:new_my_pharmacist/core/helpers/auth_validator_helper.dart';
import 'package:new_my_pharmacist/core/helpers/toast_helper.dart';
import 'package:new_my_pharmacist/core/routes.dart';
import 'package:new_my_pharmacist/features/auth/presentation/widgets/custom_button.dart';
import 'package:new_my_pharmacist/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:new_my_pharmacist/features/auth/presentation/widgets/loading_widget.dart';
import 'package:new_my_pharmacist/features/auth/presentation/widgets/signup_footer.dart';
import 'package:new_my_pharmacist/features/auth/presentation/providers/auth_provider.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
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
      await authService.signUp(email, password);
      ToastHelper.showToast('Sign Up successful!');
      if (mounted) {
        context.pushReplacement(AppRoutes.home);
      }
    } catch (e) {
      final errorMessage = AuthErrorHandler.getErrorMessage(e as Exception);
      ToastHelper.showToast(errorMessage);
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 100.h),
            Image.asset(
              'assets/Screenshot_2025-04-02_202531-removebg-preview.png',
              height: 150.h,
            ),
            Expanded(
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 470.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(70),
                          ),
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
                                  ? Container() // Empty container when loading
                                  : CustomButton(
                                    text: 'Sign Up',
                                    onPressed: _signUp,
                                  ),
                              SizedBox(height: 15.h),
                              const SignupFooter(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (_isLoading) const LoadingWidget(),
                ],
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
          'Sign Up',
          style: TextStyle(
            color: AppColors.textPrimaryColor,
            fontSize: 40.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Create an account to get started',
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
