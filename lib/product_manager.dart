import 'package:first_app/product.dart';
import 'package:flutter/material.dart';

class ProductManager extends StatefulWidget {
  String startingProduct;
  ProductManager(this.startingProduct);
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
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.all(10.0),
        child: RaisedButton(
          color: Theme.of(context).primaryColor,
          onPressed: () {
            setState(() {
              _products.add('value');
            });
          },
          child: Text('Add Product'),
        ),
      ),
      Product(_products)
    ],
    );
  }
}
