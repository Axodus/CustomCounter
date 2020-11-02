import 'package:CustomCounter/config/colors.dart';
import 'package:CustomCounter/screens/homeScreen.dart';
import 'package:CustomCounter/screens/config.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int currentIndex = 0;

  final List < Widget > _children = [
    HomeScreen(),
    Config()
  ];

  void _onItemTapped (int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget build(BuildContext context){
    return Scaffold(
      body: _children[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const < BottomNavigationBarItem > [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home" 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Config"
          ),
        ],
        currentIndex: currentIndex,
        selectedItemColor: primary,
        onTap: _onItemTapped,
        unselectedItemColor: Colors.grey[400],
        showSelectedLabels: true,
        showUnselectedLabels: false,
      ),
    );
  }
}