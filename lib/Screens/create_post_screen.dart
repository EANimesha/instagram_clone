import 'package:flutter/material.dart';

class CreatePostScreen extends StatefulWidget {
  CreatePostScreen({Key key}) : super(key: key);

  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
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
        child: Text('Create Post Screen'),
      ),
    );
  }
}