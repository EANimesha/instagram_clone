import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/Screens/feed_screen.dart';
import 'package:instagram_clone/Screens/home_screen.dart';
import 'package:instagram_clone/Screens/login_screen.dart';
import 'package:instagram_clone/Screens/signup_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget _getScreenId(){
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext conntext,snapshot){
        if(snapshot.hasData){
          return HomeScreen();
        }
        else{
          return LoginScreen();
        }
      });
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instragram Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _getScreenId(),
      routes: {
        LoginScreen.id:(context)=>LoginScreen(),
        SignUpScreen.id:(context)=>SignUpScreen(),
        FeedScreen.id:(context)=>FeedScreen()
      },
    );
  }
}

