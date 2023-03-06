import 'package:apinew/new_detalise.dart';
import 'package:apinew/search.dart';
import 'package:flutter/material.dart';
import 'layout/home_screen.dart';
import 'my_theme.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:HomeLayout.routeName ,
      routes: {
        HomeLayout.routeName:(context)=>HomeLayout(),
        new_detalise.routeName:(context)=>new_detalise(),
        search.routeName:(context)=>search(),
      },
      theme: MyThemeData.lightTheme,
      debugShowCheckedModeBanner:false ,

    );
  }
}