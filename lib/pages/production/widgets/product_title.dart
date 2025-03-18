
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/models/product_model.dart';
import '../../cart/provider.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  ProductTile({required this.product});

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context, listen: false);

    return ListTile(
      title: Text(product.name),
      subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
      trailing: IconButton(
        icon: Icon(Icons.add_shopping_cart),
        onPressed: () {
          cartProvider.addToCart(product);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${product.name} added to cart!')),
          );
        },
      ),
    );
  }
}