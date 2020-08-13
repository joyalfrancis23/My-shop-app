//This is a Widget that is used to create a side Drawer on each and every screen.
//It contains options like shop,Orders,manage products. 
import 'package:My_shop/screens/user_products.dart';
import 'package:flutter/material.dart';
import '../screens/order_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children:<Widget>[
          AppBar(title: Text('My Shop'),
          automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading:Icon(Icons.shop,),
            title: Text('Shop'),
            onTap:(){ Navigator.of(context).pushReplacementNamed('/');}
          ),
           Divider(),
          ListTile(
            leading:Icon(Icons.payment,),
            title: Text('Orders'),
            onTap:(){ Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);}
          ),
          Divider(),
          ListTile(
            leading:Icon(Icons.payment,),
            title: Text('Manage Products'),
            onTap:(){ Navigator.of(context).pushReplacementNamed(UserProductsScreen.routeName);}
          ),
          
        ]
      ),
    );
  }
}