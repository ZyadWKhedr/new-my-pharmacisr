import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:new_my_pharmacist/core/consts/colors.dart';
import 'package:new_my_pharmacist/core/routes.dart';

class QuickAccessGrid extends StatelessWidget {
  const QuickAccessGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      QuickAccessItem(
        title: 'Medication Reminder',
        icon: Icons.alarm,
        color: AppColors.primaryColor, // Dark Purple
        onTap: () => context.push(AppRoutes.reminders),
      ),
      QuickAccessItem(
        title: 'AI Chat',
        icon: Icons.chat_bubble,
        color: AppColors.accentColor, // Orange
        onTap: () => context.push(AppRoutes.chat),
      ),
      QuickAccessItem(
        title: 'Favourites',
        icon: Icons.favorite,
        color: AppColors.errorColor, // Red
        onTap: () => context.push(AppRoutes.favourites),
      ),
      QuickAccessItem(
        title: 'Emergency Contacts',
        icon: Icons.emergency,
        color: AppColors.secondaryColor, // Deep Blue
        onTap: () => context.push(AppRoutes.emergency),
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) => QuickAccessCard(item: items[index]),
      ),
    );
  }
}

class QuickAccessItem {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const QuickAccessItem({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });
}

class QuickAccessCard extends StatelessWidget {
  final QuickAccessItem item;

  const QuickAccessCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: item.onTap,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.cardColor, // White background
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.dividerColor,
            ), // Light gray border
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: item.color.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(item.icon, size: 24, color: item.color),
                ),
                const SizedBox(height: 8),
                Text(
                  item.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: AppColors.primaryColor, // Dark purple text
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
