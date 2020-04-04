import 'package:first_app/pages/auth.dart';
import 'package:first_app/pages/products_admin.dart';
import 'package:first_app/pages/products.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

void main() {
  // debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled=true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  _routes() {
    return {
      '/': (BuildContext context) => ProductsPage(),
      'admin': (BuildContext context) => ProductsAdminPage(),
    };
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
    );
  }
}
