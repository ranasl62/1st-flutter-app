import 'package:flutter/material.dart';
import 'home.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // print(widget.);
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/food.jpg'),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Details!'),
          ),
          Container(
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                color: Theme.of(context).accentColor,
                child: Text('Back'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
              )
        ],
      ),
    );
  }
}
