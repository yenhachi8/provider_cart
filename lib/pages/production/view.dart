import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/common/models/product_model.dart';
import 'package:provider_test/pages/production/index.dart';
import 'package:provider_test/pages/production/widgets/product_title.dart';

import '../cart/provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);
    var products = productProvider.products;
    return Scaffold(
      appBar: AppBar(title: Text('Products'),actions: [
        Consumer<CartProvider>(
          builder: (context, cart, child) {
            print('CartProvider build');
            return Badge(
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.pushNamed(context, '/cart');
                },
              ),
              label: Text(cart.items.length.toString()),
            );
          },
        )
      ],),

      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          print('ListView.builder build');
          Product product = products[index];
          return ProductTile(product: product);
        },
      ),
    );
  }
}

