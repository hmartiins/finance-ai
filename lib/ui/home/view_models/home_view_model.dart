import 'package:flutter/widgets.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel();

  final TextEditingController month = TextEditingController();

  set monthValue(String value) {
    month.text = value;
    notifyListeners();
  }
}
