import 'package:flutter/material.dart';
import 'package:chapter11part2/pages/home.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
 // This widget is the root of your application.
 @override
 Widget build(BuildContext context) {
 return MaterialApp(
 home: Home(),
 );
 }
}