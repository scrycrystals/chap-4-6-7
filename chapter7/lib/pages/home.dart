import 'package:flutter/material.dart';
import 'package:chapter7/widgets/animated_container.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: SafeArea(
            child: Column(
          children: <Widget>[
            AnimatedContainerWidget(),
          ],
        )));
  }
}

