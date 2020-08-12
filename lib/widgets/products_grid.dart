//This File lets our products to get displayed in a grid style.
import 'package:My_shop/providers/products_provider.dart';
import 'package:flutter/material.dart';

import '../widgets/product_item.dart';
import 'package:provider/provider.dart';


class ProductsGrid extends StatelessWidget {
 final bool showFavorites;
 ProductsGrid(this.showFavorites);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFavorites? productsData.favoriteProducts:productsData.items;
    return GridView.builder(
      
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        childAspectRatio: 3/2,
        crossAxisSpacing: 10
        ),
        padding: EdgeInsets.all(10),
       itemBuilder: (ctx,index) => ChangeNotifierProvider.value(
         value: products[index],
         child:ProductItem(
        //  products[index].id,
        //  products[index].title,
        //  products[index].imageUrl,
       ),
       ), 
       itemCount: products.length,
       );
  }
}