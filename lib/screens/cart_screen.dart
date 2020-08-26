//This screen is displayed when we tap in the cart icon on the appBar 
//Here we can see the list of items that are added to cart and we can order the items in this screen
import 'package:flutter/material.dart';

import '../providers/cart.dart';
import 'package:provider/provider.dart';
import '../widgets/cart_item.dart';
import '../providers/orders.dart';


class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
   
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart',
        style: TextStyle(fontSize: 20,fontFamily: 'Anton'),
        ),
        
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Total',
                  style: TextStyle(fontSize:17,fontWeight: FontWeight.bold),
                  ),
                    SizedBox(width:10),
                    Spacer(),
                    Chip(label: Text('Rs:${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),backgroundColor: Theme.of(context).primaryColor,
                    
                    ),
                    OrderButton(cart: cart)

                ],
              ),
            ),
            ),
            SizedBox(height:10),
            Expanded(
              child: ListView.builder(
                itemCount: cart.itemCount ,
                itemBuilder: (ctx,index) => CartItem(
                  cart.items.values.toList()[index].id,
                  cart.items.keys.toList()[index],
                  cart.items.values.toList()[index].title,
                  cart.items.values.toList()[index].price,
                  cart.items.values.toList()[index].quantity
                  ),
                
                )
            )
        ],
      ),
    );
  }
}

class OrderButton extends StatefulWidget {
  const OrderButton({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final Cart cart;
  

  @override
  _OrderButtonState createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return FlatButton(onPressed: (widget.cart.totalAmount<=0||_isLoading)? null:()async{
      setState(() {
        _isLoading = true;
      });
      await Provider.of<Order>(context,listen: false).addOrders(widget.cart.items.values.toList(), widget.cart.totalAmount);
       setState(() {
        _isLoading = false;
      });
      widget.cart.clear();
    }, child: _isLoading? CircularProgressIndicator():Text('ORDER NOW',style: TextStyle(color:Theme.of(context).primaryColor),));
  }
}
