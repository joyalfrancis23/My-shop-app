//This is the screen that is displayed after we tap into the Manage Products section in the side drawer
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';
import '../widgets/user_products.dart';
import '../widgets/app_drawer.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products-screen';
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(title: Text('My Products'),
      actions: <Widget>[
        IconButton(icon: const Icon(Icons.add),onPressed: (){

        },),
      ],
      ),
      drawer: AppDrawer(),
      body: Padding(padding: EdgeInsets.all(8),
          child: ListView.builder(itemCount: productsData.items.length ,
          
          itemBuilder:(_,index) => Column(
            children: <Widget>[
              UserItems(productsData.items[index].title,productsData.items[index].imageUrl),
              Divider(),
            ],
          ),
          
          ),
      
      ),

    );
  }
}