import 'package:provider_test/common/models/product_model.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product,  this.quantity=1});
}
