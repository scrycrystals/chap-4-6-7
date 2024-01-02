import 'package:flutter/material.dart';
import 'package:chapter11/pages/home.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
 // This widget is the root of your application.
 @override
 Widget build(BuildContext context) {
 return MaterialApp(
 debugShowCheckedModeBanner: false,
 title: 'Starter Template',
 theme: ThemeData(
 primarySwatch: Colors.lightGreen,
 ),
 home: Home(),
 );
 }
}