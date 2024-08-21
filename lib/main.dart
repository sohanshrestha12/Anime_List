import 'package:anime_flutter/screens/home.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
   debugShowCheckedModeBanner: false,
    theme: ThemeData(
      appBarTheme: AppBarTheme(
        color: Colors.black12,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,letterSpacing: 1),
      ),
      scaffoldBackgroundColor: Color(0xFF121212),
      textTheme: TextTheme(
        bodyMedium: TextStyle(color: Colors.white),
      )
    ),
    home: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.menu),
        ),
        title: Text('MyAnimeList'),
        actions: <Widget>[
          IconButton(onPressed: (){}, icon:Icon(Icons.search) ),
        ],
      ),
      body: Home(),
    ),
  ));
}