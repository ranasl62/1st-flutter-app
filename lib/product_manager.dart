import 'package:first_app/product.dart';
import 'package:first_app/product_control.dart';
import 'package:flutter/material.dart';

class ProductManager extends StatefulWidget {
  String startingProduct;
  ProductManager({this.startingProduct = 'Default Value'});
  @override
  State<StatefulWidget> createState() {
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<String> _products = [];
  @override
  void initState() {
    _products.add(widget.startingProduct);
    super.initState();
  }

  void _addProduct(String product) {
    setState(() {
      _products.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(margin: EdgeInsets.all(10.0), child: ProductControl(_addProduct)),
        Product(_products)
      ],
    );
  }
}
