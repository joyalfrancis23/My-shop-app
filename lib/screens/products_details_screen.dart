//This is the screen that contains the details of our products 
//This screen will be visible when we click the image of a product.
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // ProductDetailScreen(this.title);
  static const routeName = '/product-details';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as Map<String,String>;
    final productName = productId['title'];

    return Scaffold(
      appBar: AppBar(title: Text(productName),),
      body: Center(child:Text('Building...')),
      
    );
  }
}