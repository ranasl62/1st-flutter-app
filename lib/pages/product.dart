import 'package:flutter/material.dart';
import 'home.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  ProductPage({this.title, this.imageUrl});
  @override
  Widget build(BuildContext context) {
    // print(widget.);
    return WillPopScope(
        onWillPop: () {
          Navigator.pop(context, false);
          return Future.value(false);
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 220.0,
                  padding: EdgeInsets.all(10.0),
                  child: Image.asset(imageUrl),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(title),
                ),
                Container(
                    padding: EdgeInsets.all(10.0),
                    child: RaisedButton(
                      color: Theme.of(context).accentColor,
                      child: Text('Delete'),
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                    ))
              ],
            ),
          ),
        ));
  }
}
