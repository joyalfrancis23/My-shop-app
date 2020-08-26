//This is the file that contains ordered items skelton and some functions related to ordering items.

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import './cart.dart';


class OrderItems{
 final String id;
 final double amount;
 final List<CartItems> products;
 final DateTime dateTime;
 OrderItems({
   @required this.id,
   @required this.amount,
   @required this.products,
   @required this.dateTime

 });
}
class Order with ChangeNotifier{

List <OrderItems> _orders = [];

List <OrderItems> get orders{
  return [..._orders];
} 
Future<void> fetchAndSetOrders()async{
const url = 'https://shop-app-fdd66.firebaseio.com/orders.json';
final response = await http.get(url);
final List <OrderItems> loadedData=[];
final extractedData = json.decode(response.body) as Map<String,dynamic>;
if (extractedData == null){
  return;
}
extractedData.forEach((orderId,orderData){
  loadedData.add(OrderItems(
    id: orderId,
    amount: orderData['amount'],
    dateTime: DateTime.parse(orderData['dateTime']),
    products: (orderData['products'] as List<dynamic>).map((e) => CartItems(
      id: e['id'],
      price: e['price'],
      quantity: e['quantity'],
      title: e['title'],
    )).toList(),

    
  ));
});
_orders = loadedData.reversed.toList();
notifyListeners();
}
Future<void> addOrders(List <CartItems> cartProducts, double total )async{
  final url = 'https://shop-app-fdd66.firebaseio.com/orders.json';
  var datetimeStamp = DateTime.now();
  final response = await http.post(url,
  body: json.encode({
    'amount':total,
    'dateTime':datetimeStamp.toIso8601String(),
    'products': cartProducts.map((e) => {
      'id':e.id,
      'title':e.title,
      'price':e.price,
      'quantity':e.quantity
    }).toList(),

  })
  );
  _orders.insert(0, OrderItems(
    id: json.decode(response.body)['name'], 
    amount: total, 
    products: cartProducts, 
    dateTime: DateTime.now()
    ));
  notifyListeners();
}


}