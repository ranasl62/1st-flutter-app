import 'package:first_app/pages/products_admin.dart';
import 'package:first_app/pages/products.dart';
import 'package:first_app/pages/product.dart';
import 'package:first_app/pages/auth.dart';
import 'package:flutter/material.dart';

void main() {
  // debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled=true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> _products = [];

  @override
  void initState() {
    super.initState();
  }

  void _addProduct(Map<String, dynamic> product) {
    setState(() {
      print(product);
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

  _routes() {
    return <String, WidgetBuilder>{
      // '/': (BuildContext context) => ProductsPage(products: _products),
      'admin': (BuildContext context) => ProductsAdminPage(
            addProduct: _addProduct,
            deleteProduct: _deleteProduct,
          ),
    };
  }

  MaterialPageRoute<dynamic> _onGenerateRoutes(RouteSettings settings) {
    final List<String> pathElements = settings.name.split('/');
    print(pathElements);
    if (pathElements[0] == 'product') {
      final int index = int.parse(pathElements[1]);

      return MaterialPageRoute<bool>(
          builder: (BuildContext context) => ProductPage(
                title: _products[index]['title'],
                imageUrl: _products[index]['image'],
                price: _products[index]['price'],
                description: _products[index]['description'],
              ));
    }
    return null;
  }

  MaterialPageRoute<dynamic> _onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (BuildContext context) => ProductsPage(products: _products));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowMaterialGrid: true,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepPurple,
        brightness: Brightness.light,
      ),
      home: AuthPage(),
      routes: _routes(),
      onGenerateRoute: _onGenerateRoutes,
      onUnknownRoute: _onUnknownRoute,
    );
  }
}
