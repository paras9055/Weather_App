import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/Repositories/repo.dart';
import 'package:weather_app/screens/MyWidgets/custom_widgets.dart';
import 'package:weather_app/screens/hourly_weather_screen.dart';
import 'package:weather_app/screens/weather_by_time.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(forcastWeatherProvider).when(
          data: (data) {
            return Container(
              height: double.maxFinite,
              width: double.maxFinite,
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
                    child: Column(
                      children: [
                        const SizedBox(height: 80),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(CupertinoIcons.location, color: Colors.blue),
                            Text(
                              data.location?.name ?? "",
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 12, spreadRadius: -5)],
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(24),
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
                                          (data.current?.tempC?.ceil().toString() ?? "") + " \u2103",
                                          style: const TextStyle(color: Colors.black, fontSize: 40),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          (data.current?.tempF?.ceil().toString() ?? "") + " \u2109",
                                          style: const TextStyle(color: Colors.grey, fontSize: 26),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Humidity"),
                                Row(
                                  children: [
                                    Text(data.current?.humidity.toString() ?? ""),
                                    const Text("%"),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Uv Index"),
                                Text(data.current?.uv.toString() ?? ""),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Wind Speed"),
                                Row(
                                  children: [
                                    Text(data.current?.windKph.toString() ?? ""),
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
                                    Text(data.current?.cloud.toString() ?? ""),
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
                                    Text(data.current?.pressureIn.toString() ?? ""),
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
                  const Expanded(child: SizedBox()),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (builder) {
                                  return HourlyWeather(
                                    listView: ListView.builder(
                                      itemCount: data.forecast?.forecastday?.elementAt(0).hour?.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: EdgeInsets.only(
                                              bottom: index == 23 ? 10 : 14, left: 20, right: 20, top: index == 0 ? 5 : 0),
                                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(18),
                                              color: Colors.white,
                                              boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 12, spreadRadius: -5)]),
                                          child: InkWell(
                                            onTap: () {
                                              var element = data.forecast?.forecastday?.elementAt(0).hour?.elementAt(index);
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (builder) => WeatherByTime(
                                                    tempC: (element?.tempC?.ceil().toString() ?? "") + " \u2103",
                                                    humidity: (element?.humidity.toString() ?? "") + "%",
                                                    pressure: element?.pressureIn.toString() ?? "",
                                                    rainProbability: element?.chanceOfRain.toString() ?? "",
                                                    tempF: element?.tempF?.ceil().toString() ?? "",
                                                    uvIndex: element?.uv.toString() ?? "",
                                                    windSpeed: element?.windKph.toString() ?? "",
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.all(18),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    data.forecast!.forecastday!
                                                        .elementAt(0)
                                                        .hour!
                                                        .elementAt(index)
                                                        .time
                                                        .toString(),
                                                    style: const TextStyle(fontSize: 18),
                                                  ),
                                                  Text(
                                                    data.forecast!.forecastday!
                                                            .elementAt(0)
                                                            .hour!
                                                            .elementAt(index)
                                                            .tempC!
                                                            .ceil()
                                                            .toString() +
                                                        " \u2103",
                                                    style: const TextStyle(fontSize: 18),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                          child: weekTempData(
                            data: data,
                            date: data.forecast?.forecastday?.elementAt(0).date.toString() ?? "",
                            dayTemp: data.current?.tempC?.ceil().toString() ?? "",
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (builder) => HourlyWeather(
                                  listView: ListView.builder(
                                    itemCount: data.forecast?.forecastday?.elementAt(1).hour?.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: EdgeInsets.only(
                                            bottom: index == 23 ? 10 : 14, left: 20, right: 20, top: index == 0 ? 5 : 0),
                                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(18),
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(color: Colors.grey, blurRadius: 12, spreadRadius: -5),
                                          ],
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            var element = data.forecast?.forecastday?.elementAt(1).hour?.elementAt(index);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (builder) => WeatherByTime(
                                                  tempC: (element?.tempC?.ceil().toString() ?? "") + " \u2103",
                                                  humidity: (element?.humidity.toString() ?? "") + "%",
                                                  pressure: element?.pressureIn.toString() ?? "",
                                                  rainProbability: element?.chanceOfRain.toString() ?? "",
                                                  tempF: element?.tempF?.ceil().toString() ?? "",
                                                  uvIndex: element?.uv.toString() ?? "",
                                                  windSpeed: element?.windKph.toString() ?? "",
                                                ),
                                              ),
                                            );
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(18),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  data.forecast!.forecastday!.elementAt(1).hour!.elementAt(index).time.toString(),
                                                  style: const TextStyle(fontSize: 18),
                                                ),
                                                Text(
                                                  data.forecast!.forecastday!
                                                          .elementAt(1)
                                                          .hour!
                                                          .elementAt(index)
                                                          .tempC!
                                                          .ceil()
                                                          .toString() +
                                                      " \u2103",
                                                  style: const TextStyle(fontSize: 18),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                          child: weekTempData(
                            data: data,
                            date: data.forecast?.forecastday?.elementAt(1).date.toString() ?? "",
                            dayTemp: data.forecast?.forecastday?.elementAt(1).day?.maxtempC?.ceil().toString() ?? "",
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (builder) => HourlyWeather(
                                  listView: ListView.builder(
                                    itemCount: data.forecast?.forecastday?.elementAt(2).hour?.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: EdgeInsets.only(
                                            bottom: index == 23 ? 10 : 14, left: 20, right: 20, top: index == 0 ? 5 : 0),
                                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(18),
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(color: Colors.grey, blurRadius: 12, spreadRadius: -5),
                                          ],
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            var element = data.forecast?.forecastday?.elementAt(2).hour?.elementAt(index);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (builder) => WeatherByTime(
                                                  tempC: (element?.tempC?.ceil().toString() ?? "") + " \u2103",
                                                  humidity: (element?.humidity.toString() ?? "") + "%",
                                                  pressure: element?.pressureIn.toString() ?? "",
                                                  rainProbability: element?.chanceOfRain.toString() ?? "",
                                                  tempF: element?.tempF?.ceil().toString() ?? "",
                                                  uvIndex: element?.uv.toString() ?? "",
                                                  windSpeed: element?.windKph.toString() ?? "",
                                                ),
                                              ),
                                            );
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(18),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  data.forecast?.forecastday
                                                          ?.elementAt(2)
                                                          .hour
                                                          ?.elementAt(index)
                                                          .time
                                                          .toString() ??
                                                      "",
                                                  style: const TextStyle(fontSize: 18),
                                                ),
                                                Text(
                                                  data.forecast!.forecastday!
                                                          .elementAt(2)
                                                          .hour!
                                                          .elementAt(index)
                                                          .tempC!
                                                          .ceil()
                                                          .toString() +
                                                      " \u2103",
                                                  style: const TextStyle(fontSize: 18),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                          child: weekTempData(
                            data: data,
                            date: data.forecast?.forecastday?.elementAt(2).date.toString() ?? "",
                            dayTemp: data.forecast?.forecastday?.elementAt(2).day?.maxtempC?.ceil().toString() ?? "",
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18)
                ],
              ),
            );
          },
          error: (error, st) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(error.toString()),
                ElevatedButton(
                    onPressed: () {
                      ref.refresh(weatherProvider);
                    },
                    child: const Text("Tap to refresh")),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
        );
  }
}
