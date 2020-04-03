import 'package:first_app/pages/product_cretae.dart';
import 'package:first_app/pages/product_list.dart';
import 'package:first_app/pages/products.dart';
import 'package:flutter/material.dart';
import '../product_manager.dart';

class ProductsAdminPage extends StatelessWidget {
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
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => ProductsPage()));
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
              ProductCreatePage(),
              ProductListPage()
            ],
          )),
    );
  }
}
