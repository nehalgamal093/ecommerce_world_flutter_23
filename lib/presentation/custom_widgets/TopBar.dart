import'package:flutter/material.dart';

topBar(String title) {
  return PreferredSize(

    preferredSize: const Size.fromHeight(80.0),
    child:  Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppBar(

        backgroundColor: Colors.white,
        title: Text(title),
        leading:const Icon(Icons.arrow_back),
        centerTitle: true,
      ),
    ),
  );
}
