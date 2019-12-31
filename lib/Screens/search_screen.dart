import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/Models/user_models.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}


class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  Future<QuerySnapshot> _users;

  _buildUserTile(User user){
    return ListTile(
      title: Text(user.name),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15.0),
              border: InputBorder.none,
              hintText: 'Search',
              prefixIcon: Icon(Icons.search,size: 30.0,),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: ()=>print('clear'),
              ),
              filled: true
              ),
              onSubmitted: (input){
                print(input);
              },
        ),
      ),
      body:FutureBuilder(
        future: _users,
        builder: (context,snapshot){
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(snapshot.data.documents.length==0){
            return Center(
              child: Text('No users found! Please try again'),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data.documets.length,
            itemBuilder: (BuildContext context,int index){
              User user=User.fromDoc(snapshot.data.documents.snapshot);
              return _buildUserTile(user);
            },
          );
        },
      ),
    );
  }
}
