import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_my_pharmacist/features/home/presentation/providers/health_tip_provider.dart';
import 'package:new_my_pharmacist/features/home/presentation/widgets/article_slider.dart';
import 'package:new_my_pharmacist/features/home/presentation/widgets/health_tip_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Pharmacist'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Health Articles',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Article Carousel
            const ArticleCarousel(),

            // Additional content sections can be added here
            const SizedBox(height: 30),
            _buildSectionHeader('Health Tips'),
            _buildHealthTipsSection(),

            const SizedBox(height: 30),
            _buildSectionHeader('Quick Access'),
            _buildQuickAccessGrid(),

            // Add bottom padding to account for the navigation bar
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () {
              // View all action
            },
            child: Text('View All'),
          ),
        ],
      ),
    );
  }

  Widget _buildHealthTipsSection() {
    return Consumer(
      builder: (context, ref, child) {
        final dailyTipsAsync = ref.watch(randomHealthTipsProvider);

        return SizedBox(
          height: 120,
          child: dailyTipsAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(child: Text('Error loading tips')),
            data:
                (tips) => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: tips.length,
                  itemBuilder:
                      (context, index) => HealthTipCard(tip: tips[index]),
                ),
          ),
        );
      },
    );
  }

  Widget _buildQuickAccessGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          _buildQuickAccessItem(
            'Medication Reminder',
            Icons.alarm,
            Colors.teal,
          ),
          _buildQuickAccessItem(
            'Find Pharmacy',
            Icons.local_pharmacy,
            Colors.orange,
          ),
          _buildQuickAccessItem(
            'Pill Identifier',
            Icons.medication,
            Colors.purple,
          ),
          _buildQuickAccessItem(
            'Emergency Contacts',
            Icons.emergency,
            Colors.red,
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAccessItem(String title, IconData icon, Color color) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          // Handle tap
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 30, color: color),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
