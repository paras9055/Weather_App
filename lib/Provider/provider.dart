import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = ChangeNotifierProvider((_) => HomeChangeProvider());

class HomeChangeProvider extends ChangeNotifier {
  final TextEditingController textFieldController = TextEditingController();

  onSearchPressed() {
    notifyListeners();
  }
}
