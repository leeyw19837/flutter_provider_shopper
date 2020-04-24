import 'package:flutter/cupertino.dart';
import 'package:providershopper/models/catalog.dart';

class CartModel extends ChangeNotifier{
  CatalogModal _catalog;
  final List<int> _itemIds = [];

  CatalogModal get catalog => _catalog;

  set catalog(CatalogModal value) {
    assert(value!=null);
    assert(_itemIds.every((id)=>value.getById(id) != null), 'The catalog $value does not have one of $_itemIds in it.');
    _catalog = value;
    notifyListeners();
  }

  List<Item> get items => _itemIds.map((id)=>_catalog.getById(id)).toList();

  int get totalPrice=>items.fold(0, (total, current)=>total+current.price);

  void add(Item item) {
    _itemIds.add(item.id);
    notifyListeners();
  }
}