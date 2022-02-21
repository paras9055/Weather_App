import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/Models/weather_forcast_model.dart';

class NoDataMessage extends StatelessWidget {
  const NoDataMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          "assets/images/empty.svg",
          height: 200,
        ),
        const SizedBox(height: 20),
        const Text(
          "No data to show...",
          style: TextStyle(color: Colors.blueGrey, fontSize: 16),
        ),
      ],
    );
  }
}

Widget weekTempData({required ForcastResModel data, required String date, required String dayTemp}) {
  return AspectRatio(
    aspectRatio: 1.3 / 1.6,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 12, spreadRadius: -5)],
        color: Colors.white,
      ),
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(date, style: const TextStyle(fontWeight: FontWeight.bold)),
            const Divider(height: 1, thickness: 1, color: Colors.red, indent: 6, endIndent: 6),
            Text(
              dayTemp + " \u2103",
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    ),
  );
}
