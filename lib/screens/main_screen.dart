import 'package:flutter/material.dart';
import 'package:movie_application/core/constants/colors.dart';
import 'package:movie_application/screens/search_screen.dart';
import 'package:movie_application/screens/watchlist_screen.dart';
import 'package:movie_application/state%20management/screens_provider.dart';
import 'package:provider/provider.dart';

import '../core/shared/bottom_navigation_bar.dart';
import 'browse_screen.dart';
import 'home_screen.dart';
import 'movie_details_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static const String routeName = "MainScreen";
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    BrowseScreen(),
    WatchlistScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    ScreensProvider currentScreen = Provider.of<ScreensProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.baseColor,
      bottomNavigationBar: const BottomNavBar(),
      body: screens[currentScreen.selectedScreenIndex],
    );
  }
}
