import 'package:flutter/material.dart';
import 'package:instagram_clone/services/auth_service.dart';

class FeedScreen extends StatefulWidget {
  static final String id='feed_screen';

  FeedScreen({Key key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
           backgroundColor: Colors.white,
           centerTitle: true,
           title: Text(
             'Instagram',
             style:TextStyle(fontFamily: 'VeganStyle',fontSize: 30.0,color: Colors.black)
           ),),
      body: Center(
        child: FlatButton(
          onPressed: ()=>AuthService.logout(),
          child: Text('LOGOUT'),
        ),
      ),
    );
  }
}