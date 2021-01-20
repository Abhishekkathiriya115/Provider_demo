import 'package:flutter/foundation.dart';

class ItemsProvider extends ChangeNotifier{
  List _itemsData = [];
  
  List get getItemData => _itemsData;

  void incrementCount(int index){

    _itemsData[index]['count']++;

    notifyListeners();
  }
  
  void addItems(String value) {
    _itemsData.add({'title': value, 'count': 0});
    notifyListeners();
  }
}