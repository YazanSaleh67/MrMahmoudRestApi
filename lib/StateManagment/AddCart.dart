import 'package:course_flutter/StateManagment/ItemCart.dart';
import 'package:flutter/material.dart';

class AddCart with ChangeNotifier{
List<Item>_items = [] ;
double _price = 0.0 ;
void add(item) {
 _items.add(item) ;
 _price += item.price ;
 notifyListeners();
}
void remove(item) {
 _items.remove(item) ;
_price += item.price ;
 notifyListeners();
}
int get count{
     return _items.length ;
     
}
double get totalprice{
  return _price ;
  
  
}
List<Item> get Cartitem{
  return _items ;
}
List<Item>  items = [
    Item(name: "S20", price: 250),
    Item(name: "S30", price: 350),
  ];
}