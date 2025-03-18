import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/pages/cart/index.dart';
import 'package:provider_test/pages/production/index.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => ProductScreen(),
          '/cart': (context) => CartScreen(),
        },
      ),
    ),
  );
}
