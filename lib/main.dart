import 'package:first_app/pages/products_admin.dart';
import 'package:first_app/pages/products.dart';
import 'package:first_app/pages/product.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

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
  List<Map<String, String>> _products = [];

  @override
  void initState() {
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

  _routes() {
    return <String, WidgetBuilder>{
      '/': (BuildContext context) => ProductsPage(
            products: _products,
            addProduct: _addProduct,
            deleteProduct: _deleteProduct,
          ),
      'admin': (BuildContext context) => ProductsAdminPage(),
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
                imageUrl: _products[index]['imageUrl'],
              ));
    }
    return null;
  }

  MaterialPageRoute<dynamic> _onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (BuildContext context) => ProductsPage(
              products: _products,
              addProduct: _addProduct,
              deleteProduct: _deleteProduct,
            ));
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
      // home: AuthPage(),
      routes: _routes(),
      onGenerateRoute: _onGenerateRoutes,
      onUnknownRoute: _onUnknownRoute,
    );
  }
}
