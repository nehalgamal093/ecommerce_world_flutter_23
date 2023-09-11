import 'package:flutter/material.dart';

import '../resources/color_manager.dart';

Widget formField(BuildContext context,String title){
  return Container(
    width: MediaQuery.of(context).size.width,

    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.symmetric(vertical: 5),
    child: TextField(

      decoration: InputDecoration(
        hintText: title,
        hintStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,color:Colors.white),
        filled: true,
        fillColor: ColorManager.lightOrange,

        border: OutlineInputBorder(
            borderSide: BorderSide(color:Colors.white24,width:5)
        ),
        enabledBorder:  OutlineInputBorder(
            borderSide: BorderSide(color:Colors.white24,width:5)
        ),
        focusedBorder:  OutlineInputBorder(
            borderSide: BorderSide(color:Colors.white24,width:5)
        ),
      ),
    ),);
}