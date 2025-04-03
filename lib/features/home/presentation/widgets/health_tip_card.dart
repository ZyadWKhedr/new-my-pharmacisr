import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_my_pharmacist/core/consts/colors.dart';
import 'package:new_my_pharmacist/core/utils/icon_mapper.dart';
import 'package:new_my_pharmacist/features/home/domain/entities/health_tip_entity.dart';

class HealthTipCard extends StatelessWidget {
  final HealthTipEntity tip;

  const HealthTipCard({super.key, required this.tip});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 8.0),
      child: Card(
        color: AppColors.secondaryColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                IconMapper.getIconFromName(tip.iconName),
                size: 30.sp,
                color: AppColors.backgroundColor,
              ),
              const SizedBox(height: 8),
              Text(
                tip.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.textPrimaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
