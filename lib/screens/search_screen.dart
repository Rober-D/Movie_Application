import 'package:flutter/material.dart';

import '../core/constants/colors.dart';
import '../core/shared/bottom_navigation_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  static const String routeName = "SearchScreen";
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Center(
            child: Text(
              'Search Screen',
              style: TextStyle(fontSize: 50, color: Colors.white),
            ),
          )
        ],

    );
  }
}
