import 'package:My_shop/screens/products_details_screen.dart';
import 'package:flutter/material.dart';

import './screens/products_overview_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Shop App',
      theme: ThemeData(
        primaryColor: Colors.pinkAccent,
        accentColor: Colors.lightBlue,
        fontFamily: 'Lato',
        
        
      ),
      home: ProductsOverViewScreen(),
      routes: {
        ProductDetailScreen.routeName:(ctx) => ProductDetailScreen(), 
      },
    );
  }
}

