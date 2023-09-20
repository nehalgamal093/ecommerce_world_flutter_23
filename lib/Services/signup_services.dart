import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


Future<void> signUpServices(String name,String email,String password,String phone,BuildContext context) async {
  final response = await http.post(
      Uri.parse('https://ecommerce-nodejs-mu.vercel.app/api/v1/auth/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "name": name,
        "email": email,
        "password": password,
        "phone": phone
      }));
  if (response.statusCode == 200) {
    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>Signin()));
    // print(jsonDecode(utf8.decode(response.bodyBytes)));
  } else {
    // print(jsonDecode(utf8.decode(response.bodyBytes)));
  }
}
