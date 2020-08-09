//This is the class that contains products in Grid model this is used inside the products overview screen to get this 
//grid in the main screen of our application.. 
import 'package:flutter/material.dart';

import '../screens/products_details_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  ProductItem(this.id,this.title,this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10) ,
          child: GridTile(
        
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
            arguments: {
              'id':id,
              'title':title,
            }
            
            );
          },
          child: Image.network(imageUrl,fit: BoxFit.cover,)),
        footer: GridTileBar(
          leading: IconButton(
            icon: Icon(Icons.favorite), color: Theme.of(context).accentColor,
            onPressed: (){},
            ),
          title:Text(title,textAlign: TextAlign.center,),
          
          backgroundColor: Colors.black87,
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart), color: Theme.of(context).accentColor,
           onPressed: (){
             
           },
          ),

          ),
        ),
    );
      
  }
}