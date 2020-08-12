//This is the screen that contains the details of our products 
//This screen will be visible when we click the image of a product.
import '../providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // ProductDetailScreen(this.title);
  static const routeName = '/product-details';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct = Provider.of<Products>(context,listen: false).findById(productId);

    return Scaffold(
      appBar: AppBar(title: Text(loadedProduct.title),),
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            Container(
              height:300,
              child: ClipRRect(
                borderRadius: BorderRadius.only( bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                
                  
                  child: Image.network(loadedProduct.imageUrl,fit: BoxFit.cover,width: double.infinity,))
            ),
            SizedBox(height: 10),
            Text('₹ ${loadedProduct.price}',
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),
            ),
            SizedBox(height:10),
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: Text('${loadedProduct.description}',textAlign: TextAlign.center,))
          ],
        ),
      )
      
    );
  }
}