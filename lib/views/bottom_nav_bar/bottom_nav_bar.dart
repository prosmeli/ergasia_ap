import 'package:dummy_ar_app/room_post_extend/room_firebase_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../nav_screens/firebase_screen.dart';
import '../nav_screens/information_screen.dart';
import '../nav_screens/home_screen.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int pageIndex = 1;

  final List<Widget> _pages = [
    //const FirebaseScreen(),
    const RoomFirebaseScreen(),
    const HomeScreen(),
    const InformationPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        selectedLabelStyle: const TextStyle(
          fontSize: 14,
        ),
        currentIndex: pageIndex,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.photo),
            label: 'Firebase',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.info),
            label: 'Information',
          ),
        ],
      ),
      body: _pages[pageIndex],
    );
  }
}
