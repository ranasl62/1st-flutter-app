import 'package:first_app/products.dart';
import 'package:first_app/product_control.dart';
import 'package:flutter/material.dart';

class ProductManager extends StatefulWidget {
  Map<String, String> startingProduct;
  ProductManager({this.startingProduct});
  @override
  State<StatefulWidget> createState() {
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<Map<String, String>> _products = [];
  @override
  void initState() {
    if (widget.startingProduct != null) {
      _products.add(widget.startingProduct);
    }

    super.initState();
  }

  void _addProduct(Map<String, String> product) {
    setState(() {
      _products.add(product);
    });
  }

  _deleteProduct(int index) {
    if (index < _products.length && index >= 0) {
     setState(() {
        _products.removeAt(index);
     });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.all(10.0), child: ProductControl(_addProduct)),
        // Container(height: 450.0, child: Product(_products)),
        Expanded(child: Products(_products, _deleteProduct)),
      ],
    );
  }
}
