//This contains the scelton of the a product.
//This also contains the logic to mark a product as favorite or to unfavorite.
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier{
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavourite;
  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavourite = false});

void _errorHandler (bool newValue){
isFavourite  = newValue;
notifyListeners();
}

Future<void> toggleFavoriteStatus()async{
  final oldStatus = isFavourite;
  isFavourite = ! isFavourite;
  notifyListeners();
  
   final url ='https://shop-app-fdd66.firebaseio.com/products/$id.json';
  try{
  final response = await  http.patch(url,
  body:json.encode(
    {
      'isFavourite': isFavourite,
    }
  )
  );
  if(response.statusCode>=400){
    _errorHandler(oldStatus);
  }
  }catch(error){
_errorHandler(oldStatus);
  }

}
}
