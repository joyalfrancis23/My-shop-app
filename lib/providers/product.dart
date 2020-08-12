//This contains the scelton of the a product.
//This also contains the logic to mark a product as favorite or to unfavorite.
import 'package:flutter/foundation.dart';

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

void toggleFavoriteStatus(){
  isFavourite = ! isFavourite;
  notifyListeners();

}
}
