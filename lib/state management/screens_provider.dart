import 'package:flutter/material.dart';

class ScreensProvider extends ChangeNotifier{
  int selectedScreenIndex = 0;

  int getCurrentScreen(int index){
    selectedScreenIndex = index;
    notifyListeners();
    return selectedScreenIndex;
  }
}