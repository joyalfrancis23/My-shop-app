import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier{
  String _token;
  DateTime _expiryDate;
  String _userId;
Future<void> _authentication(String email,String password,String urlSegment)async{
final url = 'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyAYbfywCL2iY7gpnPZcWc3PI14bzZ_M8xk';
final response = await http.post(url,
body: json.encode({
'email':email,
'password':password,
'returnSecureToken': true,

}),
);
}
Future<void> signup(String email, String password) async{
return _authentication(email, password, 'signUp');
}
Future<void> signin(String email,String password)async{
 return _authentication(email, password, 'signInWithPassword');
}

}