import 'package:flutter/material.dart';
import 'package:movie_application/screens/temp_screen.dart';
import '../../screens/browse_screen.dart';
import '../../screens/home_screen/home_screen.dart';
import '../../screens/main_screen.dart';
import '../../screens/movie_details_screen.dart';
import '../../screens/search_screen.dart';
import '../../screens/splash_screen.dart';
import '../../screens/watchlist_screen/watchlist_screen.dart';

class Routes{

  static Route<dynamic> generateRoute (RouteSettings settings){
    switch (settings.name){
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (context)=> const SplashScreen(), settings: settings);
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (context)=> const HomeScreen(), settings: settings);
      case MainScreen.routeName:
        return MaterialPageRoute(builder: (context)=> const MainScreen(), settings: settings);
      case MovieDetailsScreen.routeName:
        return MaterialPageRoute(builder: (context)=> const MovieDetailsScreen(), settings: settings);
      case SearchScreen.routeName:
        return MaterialPageRoute(builder: (context)=> const SearchScreen(), settings: settings);
      case BrowseScreen.routeName:
        return MaterialPageRoute(builder: (context)=> const BrowseScreen(), settings: settings);
      case WatchlistScreen.routeName:
        return MaterialPageRoute(builder: (context)=> const WatchlistScreen(), settings: settings);
      case TempScreen.routeName:
        return MaterialPageRoute(builder: (context)=> const TempScreen(), settings: settings);
      default:
        return MaterialPageRoute(builder: (context)=>  const HomeScreen(), settings: settings);
    }
  }
}