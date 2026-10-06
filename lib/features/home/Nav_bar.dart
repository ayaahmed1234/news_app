import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:news/features/home/view.dart';
import 'package:news/features/search/view.dart';
class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}
int currentindex=0;
List<Widget> screens=[
HomeScreen(),SearchScreen()
];

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      bottomNavigationBar:CurvedNavigationBar(
        buttonBackgroundColor: Color(0xffFFA500),


        index: currentindex,
        color: Color(0xff001F3F) ,

        backgroundColor:Colors.transparent,

        onTap:(value) {
          setState(() {
            
            currentindex=value;
          });
        },
        items: [
        Icon(Icons.home,color: Colors.white,size: 26,),
        Icon(Icons.search,color: Colors.white,size: 26,),
      ],) ,

      body: screens[currentindex],

    );
  }
}
