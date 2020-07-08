import 'package:flutter/material.dart';
import './widgets/product/price_tag.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  Products([this.products = const []]); //optional arguments mention []

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Container(
              margin:
                  EdgeInsets.only(bottom: 10.0, top: 10.0), //all() another one
              // padding: EdgeInsets.all(5.0),
              // color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                      fit: FlexFit.loose, //default value
                      flex: 4, //default value
                      child: Text(
                        products[index]['title'],
                        style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Oswald',
                        ),
                      )),
                  // SizedBox(
                  //   width: 0.0,
                  // ),
                  PriceTag(price:products[index]['price'].toString()),
                  // Expanded(
                  //     flex: 2,
                  //     child: Container(
                  //       padding: EdgeInsets.symmetric(
                  //           horizontal: 6.0, vertical: 2.5),
                  //       decoration: BoxDecoration(
                  //           color: Theme.of(context).accentColor,
                  //           borderRadius: BorderRadius.circular(20.0)),
                  //       child: Text(
                  //         '\$ ' + products[index]['price'].toString(),
                  //         style: TextStyle(color: Colors.white),
                  //       ),
                  //     )),
                ],
              )),
          // SizedBox(
          //   height: 10.0,
          // ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).accentColor,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(6.0),
            ),
            child:
                Text('Bashundora City Complex, Panthopath, Dhanmondi, Dhaka'),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.info),
                iconSize: 40.0,
                onPressed: () => Navigator.pushNamed<bool>(
                        context, 'product/' + index.toString())
                    .then((bool value) {
                  if (value) {
                    // deleteProduct(index);
                  }
                }),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildProductList() {
    Widget productCard = Center(
      child: Text('No Food Found, please add some'),
    );
    if (products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    }
    return productCard;
  }

  @override
  Widget build(BuildContext context) {
    return _buildProductList();
  }
}
