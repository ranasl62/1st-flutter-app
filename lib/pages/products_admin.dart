import 'package:first_app/pages/product_cretae.dart';
import 'package:first_app/pages/product_list.dart';
import 'package:flutter/material.dart';

class ProductsAdminPage extends StatelessWidget {
  final Function addProduct;
  final Function deleteProduct;
  ProductsAdminPage({this.addProduct, this.deleteProduct});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          drawer: Drawer(
              child: Column(
            children: <Widget>[
              AppBar(
                title: Text('Choose'),
                automaticallyImplyLeading: false,
              ),
              ListTile(
                  title: Text('All Products'),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/');
                  }),
            ],
          )),
          appBar: AppBar(
            title: Text('EasyList'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.create), text: 'Create product'),
                Tab(icon: Icon(Icons.list), text: 'My Products'),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              ProductCreatePage(addProduct: addProduct),
              ProductListPage()
            ],
          )),
    );
  }
}
