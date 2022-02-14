import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/Models/weahter_res_model.dart';
import 'package:weather_app/Repositories/repo.dart';
import 'package:intl/intl.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // DateTime now = DateTime.now();
    // String formattedDate = DateFormat("dd-MM-yyyy").format(now);

    return ref.watch(weatherProvider).when(
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
                            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 18)],
                            color: Colors.white,
                          ),
                          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                          // elevation: 10,
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
                                          data.current!.tempC.toString() + " \u2103",
                                          style: const TextStyle(color: Colors.black, fontSize: 40),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          data.current!.tempF.toString() + " \u2109",
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
                                    const Text("%"),
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
                    height: MediaQuery.of(context).size.height / 5,
                    child: ListView.separated(
                      itemCount: 7,
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (_, i) => const SizedBox(width: 16),
                      itemBuilder: (_, i) => weekTempData(
                        data: data,
                        day: "Mon",
                        dayTemp: data.current?.tempC.toString() ?? "",
                      ),
                    ),
                  )
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

  Widget weekTempData({required WeatherResModel data, required String day, required String dayTemp}) {
    return AspectRatio(
      aspectRatio: 1 / 1.4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 20, spreadRadius: -5)],
          color: Colors.white,
        ),
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(day),
              const Divider(height: 1, thickness: 1, color: Colors.red, indent: 12, endIndent: 12),
              Text(dayTemp + " \u2103"),
            ],
          ),
        ),
      ),
    );
  }
}
