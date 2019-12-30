import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/Models/user_models.dart';
import 'package:instagram_clone/services/database_service.dart';
import 'package:instagram_clone/services/storage_service.dart';

class Editprofile extends StatefulWidget {
  final User user;

  Editprofile({Key key, this.user}) : super(key: key);

  @override
  _EditprofileState createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  final _formKey=GlobalKey<FormState>();
  String _name='';
  String _bio='';
  File _profileImage;

  @override
  void initState() { 
    super.initState();
    _name=widget.user.name;
    _bio=widget.user.bio;
  }

  _handleImageFromGallery() async{
    File imageFile=await ImagePicker.pickImage(source: ImageSource.gallery);
    if(imageFile!=null){
      setState(() {
        _profileImage=imageFile;
      });
    }
  }

  _displayProfileImage(){
    if (_profileImage==null) {
      if (widget.user.profileImageUrl.isEmpty) {
        return AssetImage('assets/images/user_placeholder.png');
      }else{
        //user profile image exists
        return CachedNetworkImageProvider(widget.user.profileImageUrl);
      }
    } else {
      //new profile image
      return FileImage(_profileImage);
    }
  }

  _submit() async{
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      //Update user in database
      String _profileImageUrl='';

      if (_profileImage==null) {
        _profileImageUrl=widget.user.profileImageUrl;
      } else {
        _profileImageUrl=await StorageService.uploadUserProfileImage(widget.user.profileImageUrl, _profileImage);
      }

      User user =User(
        id:widget.user.id,
        name:_name,
        bio: _bio,
        profileImageUrl: _profileImageUrl
        );

        //database Update
        DatabaseService.updateUser(user); 
        Navigator.pop(context);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
           centerTitle: true,
           backgroundColor: Colors.white,
           title: Text('Edit Profile',style: TextStyle(color: Colors.black),),
         ),
         body: SingleChildScrollView(
           child: Container(
             height: MediaQuery.of(context).size.height,
             child: Padding(
               padding: const EdgeInsets.all(30.0),
               child: Form(
                 key: _formKey,
                 child: Column(
                   children: <Widget>[
                     CircleAvatar(
                       radius: 60.0,
                       backgroundImage: _displayProfileImage(),
                     ),
                     FlatButton(
                       onPressed: _handleImageFromGallery,
                       child: Text('Change Profile Image',style:TextStyle(color:Theme.of(context).accentColor,fontSize: 16.0)),
                     ),
                     TextFormField(
                       initialValue: _name,
                       style: TextStyle(fontSize: 18.0),
                       decoration: InputDecoration(
                         icon: Icon(Icons.person,size:30.0),
                         labelText: 'Name'
                       ),
                       validator: (input)=>input.trim().length<1?'Please Enter a Valid Name':null,
                       onSaved: (input)=>_name=input,
                     ),
                     TextFormField(
                       initialValue: _bio,
                       style: TextStyle(fontSize: 18.0),
                       decoration: InputDecoration(
                         icon: Icon(Icons.book,size:30.0),
                         labelText: 'Bio'
                       ),
                       validator: (input)=>input.trim().length>150?'Please Enter bio less than 50 characters':null,
                       onSaved: (input)=>_bio=input,
                     ),
                     Container(
                       margin: EdgeInsets.all(15.0),
                       height: 40.0,
                       width: 250.0,
                       child: FlatButton(
                         onPressed: _submit,
                         color: Colors.blue,
                         textColor: Colors.white,
                         child: Text('Save Profile',style: TextStyle(fontSize: 18.0),),
                       ),
                     )
                   ],
                 ),
               ),
             ),
           ),

         ),
       );
  }
}