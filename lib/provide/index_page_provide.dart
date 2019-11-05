import 'package:flutter/material.dart';

class CurrentIndexProvider with ChangeNotifier{
  int currenIndex = 0;

  changeCurrentIndex(index){
    currenIndex = index;
    notifyListeners();
  }
}