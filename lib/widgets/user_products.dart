//This Widget gives the format of the products that are in this app for sale.
import 'package:flutter/material.dart';

class UserItems extends StatelessWidget {
  final String title;
  final String imageUrl;
  UserItems(this.title,this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(children: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            color: Colors.grey,
            onPressed: (){
              
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            color: Colors.red,
            onPressed: (){
              
            },
          )
        ],),
      ),
    );
  }
}