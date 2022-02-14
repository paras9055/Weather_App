import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/Models/weahter_res_model.dart';
import 'package:weather_app/Repositories/repo.dart';

final homeProvider = ChangeNotifierProvider((_) => HomeChangeProvider());

class HomeChangeProvider extends ChangeNotifier {
  final TextEditingController textFieldController = TextEditingController();

  onSearchPressed() {
    notifyListeners();
  }
}

// class WeatherChangeProvider with ChangeNotifier {
//   final TextEditingController textFieldController = TextEditingController();

//   weatherShow() {
//     Repositories().weahterRepo();
//     notifyListeners();
//   }
// }
