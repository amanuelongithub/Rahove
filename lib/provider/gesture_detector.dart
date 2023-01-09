import 'package:flutter/cupertino.dart';

class GestureDetectorProvider extends ChangeNotifier {
  bool isenebled;

  GestureDetectorProvider({
    this.isenebled = false,
  });

  void changeProfile() {
    isenebled = !isenebled;
    notifyListeners();
  }
}
