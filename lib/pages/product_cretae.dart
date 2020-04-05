import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }

  final Function addProduct;
  ProductCreatePage({this.addProduct});
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String titleValue = '';
  String descriptionValue = '';
  double priceValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
                labelText: 'Product Title', icon: Icon(Icons.title)),
            autofocus: true,
            onChanged: (String value) {
              setState(() {
                titleValue = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(
                labelText: 'Product Description',
                icon: Icon(Icons.description)),
            autofocus: true,
            maxLines: 2,
            onChanged: (String value) {
              setState(() {
                descriptionValue = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(
                labelText: 'Product Price', icon: Icon(Icons.attach_money)),
            keyboardType: TextInputType.number,
            autofocus: true,
            onChanged: (String value) {
              setState(() {
                priceValue = double.parse(value);
              });
            },
          ),
          RaisedButton(
            onPressed: () {
              final Map<String, dynamic> product = {
                "title": titleValue,
                "description": descriptionValue,
                "price": priceValue,
                "image":"assets/images/food.jpg"
              };
              widget.addProduct(product);
            },
            child: Text('Save'),
          )
        ],
      ),
    );
  }
}
