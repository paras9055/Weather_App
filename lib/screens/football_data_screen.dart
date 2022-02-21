import 'package:flutter/material.dart';
import 'package:weather_app/Models/sports_res_model.dart';

class FootballDataScreen extends StatelessWidget {
  const FootballDataScreen({Key? key, required this.element}) : super(key: key);

  final Football element;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                boxShadow: const [
                  BoxShadow(color: Colors.grey, spreadRadius: -5, blurRadius: 20),
                ],
                color: Colors.white,
              ),
              width: double.maxFinite,
              child: Column(
                children: [
                  const Text(
                    "Stadium",
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    element.stadium.toString(),
                    style: const TextStyle(fontSize: 24),
                  ),
                  const Divider(indent: 100, endIndent: 100, color: Colors.red),
                  const Text(
                    "Country",
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    element.country.toString(),
                    style: const TextStyle(fontSize: 24),
                  ),
                  const Divider(indent: 100, endIndent: 100, color: Colors.red),
                  const Text(
                    "Tournament",
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    element.tournament.toString(),
                    style: const TextStyle(fontSize: 24),
                  ),
                  const Divider(indent: 100, endIndent: 100, color: Colors.red),
                  const Text(
                    "Start at",
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    element.start.toString(),
                    style: const TextStyle(fontSize: 24),
                  ),
                  const Divider(indent: 100, endIndent: 100, color: Colors.red),
                  const Text(
                    "Match",
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    element.match.toString(),
                    style: const TextStyle(fontSize: 24),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
