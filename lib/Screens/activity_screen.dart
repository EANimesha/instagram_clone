import 'package:flutter/material.dart';

class ActivityScreen extends StatefulWidget {
  ActivityScreen({Key key}) : super(key: key);

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
           backgroundColor: Colors.white,
           centerTitle: true,
           title: Text(
             'Instagram',
             style:TextStyle(fontFamily: 'VeganStyle',fontSize: 30.0,color: Colors.black)
           ),),
      body: Center(
        child: Text('Activity Screen'),
      ),
    );
  }
}