import 'package:flutter/foundation.dart' as foundation;

import 'product.dart';
import 'products_repository.dart';

double _salesTaxRate = 0.06;
double _shippingCostPerItem  = 7;

class AppStateModel extends foundation.ChangeNotifier {
  List<Product> _availableProducts;
  Category _selectedCategory = Category.all;
  final _productsInCart = <int, int>{};

  Map<int, int> get productsInCart {
    return Map.from(_productsInCart);
  }

  int get totalCartQuantity {
    _productsInCart.values.fold(0, (accummulator, value) {
      return accummulator + value;
    });
  }

  Category get selectedCategory {
    return _selectedCategory;
  }

  // Totaled prices of the items in the cart
  double get subTotalCost {
    return _productsInCart.keys.map((id) {
      //extended price for product line
      return _availableProducts[id].price * _productsInCart[id];
    }).fold(0, (accumulator, value) {
      return accumulator + value;
    });
  }
}