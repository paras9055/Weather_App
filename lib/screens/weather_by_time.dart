import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/Repositories/repo.dart';

class WeatherByTime extends ConsumerWidget {
  WeatherByTime({
    Key? key,
    required this.tempC,
    required this.humidity,
    required this.pressure,
    required this.rainProbability,
    required this.tempF,
    required this.uvIndex,
    required this.windSpeed,
  }) : super(key: key);

  String tempC;
  String tempF;
  String uvIndex;
  String windSpeed;
  String rainProbability;
  String pressure;
  String humidity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 20, spreadRadius: -5)],
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(Icons.cloud_outlined, size: 120),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              tempC,
                              style: const TextStyle(color: Colors.black, fontSize: 40),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              tempF + " \u2109",
                              style: const TextStyle(color: Colors.grey, fontSize: 26),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Humidity"),
                            Row(
                              children: [
                                Text(humidity),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Uv Index"),
                            Text(uvIndex),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Wind Speed"),
                            Row(
                              children: [
                                Text(windSpeed),
                                const Text(" Kph"),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Rain Probabilty"),
                            Row(
                              children: [
                                Text(rainProbability),
                                const Text("%"),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Pressure"),
                            Row(
                              children: [
                                Text(pressure),
                                const SizedBox(width: 2),
                                const Text("Pa"),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
