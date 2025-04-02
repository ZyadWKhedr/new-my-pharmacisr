import 'package:flutter/material.dart';
import 'package:new_my_pharmacist/features/home/presentation/widgets/custom_bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // Track the current selected index

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Handle navigation based on the index
    // You can add navigation code here, for example:
    // switch (_currentIndex) {
    //   case 0:
    //     Navigator.pushNamed(context, AppRoutes.home);
    //     break;
    //   case 1:
    //     Navigator.pushNamed(context, AppRoutes.chat);
    //     break;
    //   case 2:
    //     Navigator.pushNamed(context, AppRoutes.likes);
    //     break;
    //   case 3:
    //     Navigator.pushNamed(context, AppRoutes.profile);
    //     break;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Current Index: $_currentIndex', // Show the current index
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap, // Pass the _onTap method to handle navigation
      ),
    );
  }
}
