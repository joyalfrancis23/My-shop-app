//widget from every item in a cart, this contains a model of an item in the cart screen.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';


class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final String title;
  final double price;
  final double quantity;

  CartItem(this.id,this.productId,this.title,this.price,this.quantity);
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Colors.grey[200],
        child: Icon(Icons.delete_sweep),
        margin: EdgeInsets.symmetric(
          vertical:4,
          horizontal: 15,
        ),
      ),
      direction: DismissDirection.startToEnd,
       confirmDismiss: (direction){
        return showDialog(context: context, builder: (ctx) => AlertDialog(
          title: Text('Are you sure ?'),
          content: Text('Do you want to remove the item from the cart'),
          actions: <Widget>[
            FlatButton(onPressed: (){
              Navigator.of(ctx).pop(false);
            }, child: Text('NO')
            
            ),
            FlatButton(onPressed: (){
              Navigator.of(ctx).pop(true);
            }, child: Text('YES')
            
            )

          ],
        ));
      },
      onDismissed: (direction){
        Provider.of<Cart>(context,listen:false).removeItem(productId);
      },
     
          child: Card(
        margin: EdgeInsets.symmetric(
          vertical:4,
          horizontal: 15,
        ),
        child: Padding(padding: const EdgeInsets.all(10),
        child: ListTile(
          leading: CircleAvatar(backgroundColor: Theme.of(context).accentColor,
            child: Container(padding: EdgeInsets.all(3),
              child: FittedBox(child: Text('₹ $price',
              style: TextStyle(color: Colors.white),
              ))),
          ),
          title: Text(title),
          subtitle: Text('Rs: ${(price*quantity)}'),
          trailing: Text('x  $quantity'),
        ),
        ),
      ),
    );
  }
}