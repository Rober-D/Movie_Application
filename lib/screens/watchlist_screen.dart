import 'package:flutter/material.dart';
import '../core/constants/colors.dart';
import '../core/shared/bottom_navigation_bar.dart';

class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({super.key});
  static const String routeName = "WatchlistScreen";
  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Center(child: Text('Watchlist Screen',style: TextStyle(fontSize: 50,color: Colors.white),),)
        ],
    );
  }
}
