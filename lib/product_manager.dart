import 'package:first_app/products.dart';
import 'package:flutter/material.dart';

class ProductManager extends StatelessWidget {

  final List<Map<String, dynamic>> products;
  ProductManager({this.products});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Container(height: 450.0, child: Product(_products)),
        Expanded(child: Products(products)),
      ],
    ); 
  }
}
