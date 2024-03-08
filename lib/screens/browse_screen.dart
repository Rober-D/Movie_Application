import 'package:flutter/material.dart';

import '../core/constants/colors.dart';
import '../core/shared/bottom_navigation_bar.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({super.key});
  static const String routeName = "BrowseScreen";
  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baseColor,
      body: Column(
        children: [
          Center(
            child: Text(
              'Browse Screen',
              style: TextStyle(fontSize: 50, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
