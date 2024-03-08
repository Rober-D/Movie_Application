import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_application/state%20management/screens_provider.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  @override
  Widget build(BuildContext context) {
    ScreensProvider currentScreen = Provider.of<ScreensProvider>(context);

    return BottomNavigationBar(
      currentIndex: currentScreen.selectedScreenIndex,
      showUnselectedLabels: true,
      selectedLabelStyle: const TextStyle(color: AppColors.selectedPage),
      selectedItemColor: AppColors.selectedPage,
      items: <BottomNavigationBarItem>[
        currentScreen.selectedScreenIndex == 0 ? const BottomNavigationBarItem(icon: Image(image: AssetImage("assets/icons/home_selected.png"),height: 22,),label: "Home",backgroundColor: AppColors.bottomNavBarColor):BottomNavigationBarItem(icon: Image(image: AssetImage("assets/icons/home.png"),height: 22,),label: "Home",backgroundColor: AppColors.bottomNavBarColor),
        currentScreen.selectedScreenIndex == 1 ? const BottomNavigationBarItem(icon: Image(image: AssetImage("assets/icons/search_selected.png"),height: 22,),label: "Search",backgroundColor: AppColors.bottomNavBarColor):BottomNavigationBarItem(icon: Image(image: AssetImage("assets/icons/search.png"),height: 22,),label: "Search",backgroundColor: AppColors.bottomNavBarColor),
        currentScreen.selectedScreenIndex == 2 ? const BottomNavigationBarItem(icon: Image(image: AssetImage("assets/icons/browse_selected.png"),height: 22,),label: "Browse",backgroundColor: AppColors.bottomNavBarColor):BottomNavigationBarItem(icon: Image(image: AssetImage("assets/icons/browse.png"),height: 22,),label: "Browse",backgroundColor: AppColors.bottomNavBarColor),
        currentScreen.selectedScreenIndex == 3 ? const BottomNavigationBarItem(icon: Image(image: AssetImage("assets/icons/watchlist_selected.png"),height: 22,),label: "Watchlist",backgroundColor: AppColors.bottomNavBarColor):BottomNavigationBarItem(icon: Image(image: AssetImage("assets/icons/watchlist.png"),height: 22,),label: "Watchlist",backgroundColor: AppColors.bottomNavBarColor),
      ],
      onTap: (index){
        setState(() {
          currentScreen.getCurrentScreen(index);
          print(currentScreen.selectedScreenIndex);
        });
      },
    );
  }
}
