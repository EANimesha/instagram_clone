
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/Screens/create_post_screen.dart';
import 'package:instagram_clone/Screens/feed_screen.dart';
import 'package:instagram_clone/Screens/profile_screen.dart';
import 'package:instagram_clone/Screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  final String userId;
  HomeScreen({Key key, this.userId}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTab=0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
     _pageController=PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
           body:PageView(
             controller: _pageController,
             children: <Widget>[
               FeedScreen(),
               SearchScreen(),
               ProfileScreen(),
               CreatePostScreen(),
               ProfileScreen(userId: widget.userId,)
             ],
             onPageChanged: (int index){
               setState(() {
                 _currentTab=index;
               });
             },
           ),
           bottomNavigationBar: CupertinoTabBar(
             currentIndex: _currentTab,
             onTap: (int index){
               setState(() {
                 _currentTab=index;
               });
              _pageController.animateToPage(
                index,
                duration: Duration(milliseconds: 200), 
                curve: Curves.easeIn
              ); 
             },
             activeColor: Colors.black,
             items: [
                BottomNavigationBarItem(
                 icon: Icon(
                   Icons.home,
                   size:32.0
                 )
               ),
               BottomNavigationBarItem(
                 icon: Icon(
                   Icons.search,
                   size:32.0
                 )
               ),
               BottomNavigationBarItem(
                 icon: Icon(
                   Icons.photo_camera,
                   size:32.0
                 )
               ),
               BottomNavigationBarItem(
                 icon: Icon(
                   Icons.notifications,
                   size:32.0
                 )
               ),
               BottomNavigationBarItem(
                 icon: Icon(
                   Icons.account_circle,
                   size:32.0
                 )
               ),

             ],
           )
       ),
    );
  }
}