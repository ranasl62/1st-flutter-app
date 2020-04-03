import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  final List<String> products;
  Product([this.products = const []]); //optional arguments mention []
  Widget _buildProductItem(BuildContext contex, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset('assets/images/food.jpg'),
          Text(products[index])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return products.length > 0 ? ListView.builder(
      itemBuilder: _buildProductItem,
      itemCount: products.length,
    ):Center(child: Text('No Food Found, please add some'),);
  }
}
