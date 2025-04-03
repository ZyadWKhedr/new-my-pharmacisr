import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_my_pharmacist/core/consts/colors.dart';
import 'package:new_my_pharmacist/core/utils/icon_mapper.dart';
import 'package:new_my_pharmacist/features/home/domain/entities/health_tip_entity.dart';

class HealthTipCard extends StatelessWidget {
  final HealthTipEntity tip;
  final bool isFeatured;

  const HealthTipCard({super.key, required this.tip, this.isFeatured = false});

  @override
  Widget build(BuildContext context) {
    // Color configurations based on card type
    final backgroundColor =
        isFeatured ? AppColors.accentColor : AppColors.cardColor;

    final iconBackgroundColor =
        isFeatured
            ? AppColors.lightAccentColor.withOpacity(0.3)
            : AppColors.primaryColor.withOpacity(0.1);

    final iconColor =
        isFeatured ? AppColors.textPrimaryColor : AppColors.primaryColor;

    final textColor =
        isFeatured ? AppColors.textPrimaryColor : AppColors.textPrimaryColor;

    final borderColor =
        isFeatured ? AppColors.accentColor : AppColors.dividerColor;

    return Container(
      width: isFeatured ? 120.w : 100.w,
      margin: EdgeInsets.only(right: 12.w),
      child: Card(
        color: backgroundColor,
        elevation: isFeatured ? 6 : 2,
        shadowColor: AppColors.primaryColor.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
          side: BorderSide(color: borderColor, width: isFeatured ? 0 : 0.5),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Icon with background
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: iconBackgroundColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  IconMapper.getIconFromName(tip.iconName),
                  size: 24.w,
                  color: iconColor,
                ),
              ),
              SizedBox(height: 12.h),

              // Title text
              Text(
                tip.title,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: isFeatured ? 14.sp : 12.sp,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                  height: 1.3,
                ),
              ),

              // Featured badge with better styling
              if (isFeatured) ...[
                SizedBox(height: 8.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
                  decoration: BoxDecoration(
                    color: AppColors.textOnAccentColor.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(6.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.darkBackgroundColor.withOpacity(0.1),
                        blurRadius: 2,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Text(
                    'Featured',
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: AppColors.lightAccentColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
