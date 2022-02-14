import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/Models/weahter_res_model.dart';
import 'package:weather_app/Models/weather_forcast_model.dart';
import 'package:weather_app/Models/weather_req_model.dart';
import 'package:weather_app/Provider/provider.dart';
import 'package:weather_app/utils/constant.dart';

final weatherProvider = FutureProvider<WeatherResModel>((ref) async {
  var response = await http.get(Uri.parse(Constant.URL));

  print('response: ');
  print(response.statusCode);

  return WeatherResModel.fromJson(jsonDecode(response.body));
});

final forcastWeatherProvider = FutureProvider<ForcastResModel>((ref) async {
  var response = await http.get(Uri.parse(Constant.forcastUrl));

  print('response: ');
  print(response.statusCode);

  return ForcastResModel.fromJson(jsonDecode(response.body));
});

final weatherSearcProvider = FutureProvider<WeatherResModel>((ref) async {
  String query = ref.watch(homeProvider).textFieldController.text;

  String q = query == '' || query.isEmpty ? 'New Delhi' : query;

  var response = await http.post(
    Uri.parse(Constant.SEARCH_URL),
    body: {
      'q': q,
      'key': '898dd824c2594f409ca93335221202',
    },
  );
  print('response12343: ');
  print(response.statusCode);

  return WeatherResModel.fromJson(jsonDecode(response.body));
});
