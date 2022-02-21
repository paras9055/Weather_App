import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/BottomBarScreens/home_screen.dart';
import 'package:weather_app/BottomBarScreens/search_screen.dart';
import 'package:weather_app/BottomBarScreens/sports_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

late int currentIndex;

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  List<Widget> list = [
    const HomeScreen(),
    const SearchScreen(),
    const SportsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.sportscourt), label: "Sports"),
        ],
      ),
    );
  }
}
