
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/models/cart_item_model.dart';
import '../provider.dart';

class CartItemTile extends StatelessWidget {
  final CartItem cartItem;

  CartItemTile({required this.cartItem});

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context, listen: false);

    return ListTile(
      title: Text(cartItem.product.name),
      subtitle: Text(
        '${cartItem.quantity} x \$${cartItem.product.price.toStringAsFixed(2)}',
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          cartProvider.removeFromCart(cartItem.product.id);
        },
      ),
    );
  }
}
