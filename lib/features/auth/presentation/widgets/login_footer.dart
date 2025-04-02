import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:new_my_pharmacist/core/consts/colors.dart';
import 'package:new_my_pharmacist/core/routes.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            context.push('/forgot-password');
          },
          child: Text(
            'Forgot password?',
            style: TextStyle(
              color: AppColors.textSecondaryColor,
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
          child: Text(
            'Have an account?',
            style: TextStyle(
              color: AppColors.textSecondaryColor,
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    );
  }
}
