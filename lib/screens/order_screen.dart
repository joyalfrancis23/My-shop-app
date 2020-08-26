//This screen is displayed when we tap into the Orders section in the side drawer.
//Here we can see our list of Orders that we had did.
import 'package:flutter/material.dart';
import '../providers/orders.dart' show Order; 
import 'package:provider/provider.dart';
import '../widgets/order_item.dart';
import '../widgets/app_drawer.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/orders';

 
 
  @override
  Widget build(BuildContext context) {
    // final orderData = Provider.of<Order>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(future:Provider.of<Order>(context,listen:false).fetchAndSetOrders(),builder: (ctx, dataSnapShot){
if(dataSnapShot.connectionState == ConnectionState.waiting){
return Center(child: CircularProgressIndicator());
}else{
if(dataSnapShot.error != null){
 return Center(child: Text('An Error Occured!!!'),);
}else{
  return Consumer<Order>(builder: (ctx,orderData,child) => ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (ctx,index) => OrderItem(orderData.orders[index]),
      
      ),); 
}}
      } ,)
     
    );
  }
}