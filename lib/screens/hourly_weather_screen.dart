import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/Models/weather_forcast_model.dart';
import 'package:weather_app/Repositories/repo.dart';
import 'package:weather_app/screens/weather_by_time.dart';

class HourlyWeather extends ConsumerWidget {
  HourlyWeather({Key? key, required this.listView}) : super(key: key);

  // String time;
  // String temp;
  ListView listView;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(forcastWeatherProvider).when(
          data: (data) => Scaffold(
            backgroundColor: Colors.white,
            body: listView,
          ),
          error: (error, st) => Text("$error"),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
  }
}
