import 'package:flutter/material.dart';
import 'package:flutter_2/NavApp/ProductListPage.dart';

class NavApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductListPage(),
    );
  }
  
}