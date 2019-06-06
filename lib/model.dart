import 'package:flutter/material.dart';

class AppStateModel with ChangeNotifier {
  AppStateModel(this.pageNum);

  bool _isMenuOpened = false;
  int _pageIndex = 0;
  final int pageNum;
  bool get isMenuOpened => _isMenuOpened;
  int get pageIndex => _pageIndex;

  void toggleMenu() {
    _isMenuOpened = !_isMenuOpened;
    notifyListeners();
  }

  void nextPage() {
    if(_pageIndex < pageNum-1) {
      _pageIndex += 1;
      notifyListeners();
    }
  }

  void previousPage() {
    if(_pageIndex > 0) {
      _pageIndex += 1;
      notifyListeners();
    }
  }

  void setIndex(int newIndex) {
    if(newIndex < pageNum && newIndex >= 0){
      _pageIndex = newIndex;
      notifyListeners();
    }
  }

}