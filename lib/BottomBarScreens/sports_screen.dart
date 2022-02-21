import 'package:flutter/material.dart';
import 'package:weather_app/TabBarScreens/cricket_news_screen.dart';
import 'package:weather_app/TabBarScreens/football_news_screen.dart';
import 'package:weather_app/TabBarScreens/golf_news_screen.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Sports News",
            style: TextStyle(color: Colors.black, fontSize: 28),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          bottom: TabBar(
            labelPadding: const EdgeInsets.symmetric(vertical: 14),
            labelStyle: const TextStyle(fontSize: 16),
            unselectedLabelColor: Colors.grey,
            indicator: BoxDecoration(borderRadius: BorderRadius.circular(48), color: Colors.blue),
            tabs: const [
              Text("Football"),
              Text("Golf"),
              Text("Cricket"),
            ],
          ),
        ),
        body: const TabBarView(children: [
          FootballNewsScreen(),
          GolfNewsScreen(),
          CricketNewsScreen(),
        ]),
      ),
    );
  }
}
