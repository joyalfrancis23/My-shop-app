import 'package:My_shop/providers/orders.dart';
import 'package:My_shop/screens/cart_screen.dart';
import 'package:My_shop/screens/products_details_screen.dart';
import 'package:flutter/material.dart';

import './screens/products_overview_screen.dart';
import 'package:provider/provider.dart';
import './providers/products_provider.dart';
import './providers/cart.dart';
import './screens/order_screen.dart';
import './screens/user_products.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
      create: (ctx) => Products(),),
       ChangeNotifierProvider(
      create: (ctx) => Cart(),),
       ChangeNotifierProvider(
      create: (ctx) => Order(),),
      
    ],
          child: MaterialApp(
        title: 'My Shop App',
        theme: ThemeData(
          primaryColor: Colors.pinkAccent,
          accentColor: Colors.lightBlue,
          fontFamily: 'Lato',
          
          
        ),
        home: ProductsOverViewScreen(),
        routes: {
          ProductDetailScreen.routeName:(ctx) => ProductDetailScreen(), 
          CartScreen.routeName:(ctx) => CartScreen(),
          OrderScreen.routeName:(ctx) => OrderScreen(),
          UserProductsScreen.routeName: (ctx)=> UserProductsScreen(),
        },
      ),
    );
  }
}

