//This is the first page of our application.

import 'package:My_shop/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



import '../widgets/products_grid.dart';
import '../widgets/badge.dart';
import '../providers/cart.dart';
import '../widgets/app_drawer.dart';
import '../providers/products_provider.dart';

enum FilterOptions{
Favorites,
All
 }
class ProductsOverViewScreen extends StatefulWidget {
//  var _showOnlyFavourites = false;

  @override
  _ProductsOverViewScreenState createState() => _ProductsOverViewScreenState();
}

class _ProductsOverViewScreenState extends State<ProductsOverViewScreen> {

  var _showOnlyFavourites = false;
  var _isInit = true;
  var _isLoading = false;
  @override
  void didChangeDependencies() {
    if(_isInit){
      setState(() {
        _isLoading = true;
      });
      Provider.of<Products>(context).fetchAndSetProducts().then((_){
setState(() {
  _isLoading = false;
});
      } );
    }
    _isInit = false;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {

  
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: <Widget>[
          Consumer<Cart>(
            builder: (_,cart,ch) =>Badge(child: ch, value: cart.itemCount.toString()),
            
                      child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: (){
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              ), 
             
              ),
          
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            onSelected: (FilterOptions selectedValue){
              setState(() {
                if(selectedValue == FilterOptions.Favorites){
                _showOnlyFavourites = true;
              }
              else{
              _showOnlyFavourites = false;
              }
              });
            },
            itemBuilder: (_) => [ 
              PopupMenuItem(
              child: Text('My Favourites') ,
              value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
              child: Text('Show All') ,
              value: FilterOptions.All,
              ),
               ],
          ),
        ],
      ),
       drawer: AppDrawer(),
          body: _isLoading? Center(
            child: CircularProgressIndicator(),
          ) : ProductsGrid(_showOnlyFavourites),
    );
  }
}

