import 'package:flutter/material.dart';
import 'package:instagram_clone/Models/user_models.dart';
import 'package:instagram_clone/Screens/edit_profile.dart';
import 'package:instagram_clone/Utitlies/constants.dart';

class ProfileScreen extends StatefulWidget {
  final String userId;

  ProfileScreen({this.userId});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: usersRef.document(widget.userId).get(),
        builder: (BuildContext context,AsyncSnapshot snapshot){
        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator()
          );
        }
        User user=User.fromDoc(snapshot.data);

        return ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0.0),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: NetworkImage('https://keenthemes.com/preview/metronic/theme/assets/pages/media/profile/profile_user.jpg'),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                  '12',
                                  style:TextStyle(
                                    fontSize:18.0,
                                    fontWeight:FontWeight.w600
                                  )
                                ),
                                Text(
                                  'Posts',
                                  style:TextStyle(color:Colors.black54)
                                )
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  '45',
                                  style:TextStyle(
                                    fontSize:18.0,
                                    fontWeight:FontWeight.w600
                                  )
                                ),
                                Text(
                                  'Following',
                                  style:TextStyle(color:Colors.black54)
                                )
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  '122',
                                  style:TextStyle(
                                    fontSize:18.0,
                                    fontWeight:FontWeight.w600
                                  )
                                ),
                                Text(
                                  'Followers',
                                  style:TextStyle(color:Colors.black54)
                                )
                              ],
                            )
                          ],
                        ),
                        Container(
                          width: 200.0,
                          child: FlatButton(
                            onPressed: ()=>Navigator.push((context), MaterialPageRoute(
                              builder: (_)=>Editprofile(
                                user: user,
                              )
                            )),
                            color: Colors.blue,
                            textColor: Colors.white,
                            child: Text('Edit Profile',style:TextStyle(fontSize: 18.0)), 
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(user.name,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
                  SizedBox(height: 5.0,),
                  Container(
                    height: 80.0,
                    child: Text(user.bio,style: TextStyle(fontSize: 15.0),)
                    ),
                    Divider()
                ],
              ),
            )
          ],
        );
        },
      ),
    );
  }
}