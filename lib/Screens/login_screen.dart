import 'package:flutter/material.dart';
import 'package:instagram_clone/Screens/signup_screen.dart';
import 'package:instagram_clone/services/auth_service.dart';

class LoginScreen extends StatefulWidget {

  static final String id='login_screen';

  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey=GlobalKey<FormState>();
  String _email,_password;

  _onSubmit(){
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      // print(_email);
      // print(_password);
      AuthService.login(_email, _password,context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Instagram',style:TextStyle(fontSize: 50.0,fontFamily: 'VeganStyle')),
            Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                     padding: EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 10.0
                    ),
                    child: TextFormField(
                       decoration: InputDecoration(labelText: 'Email'),
                       validator: (input)=>!input.contains('@')?'PLease Enter Valid email':null,
                       onSaved:(input)=>_email=input,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 10.0
                    ),
                  
                    child:TextFormField(
                      decoration: InputDecoration(labelText: 'Password'),
                      validator: (input)=>input.length<6?'Must be at least 6 characters':null,
                      onSaved:(input)=>_password=input ,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: 250.0,
                    child: FlatButton(
                      onPressed: _onSubmit,
                      padding: EdgeInsets.all(10.0),
                      color: Colors.blue,
                      child: Text('Login',style:TextStyle(color:Colors.white,fontSize: 18.0)),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: 250.0,
                    child: FlatButton(
                      onPressed:()=>Navigator.pushNamed(context, SignUpScreen.id),
                      padding: EdgeInsets.all(10.0),
                      color: Colors.blue,
                      child: Text('Go to SignUp',style:TextStyle(color:Colors.white,fontSize: 18.0)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}