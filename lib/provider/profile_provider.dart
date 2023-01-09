import 'package:flutter/cupertino.dart';

class ProfileProvider extends ChangeNotifier {
  bool isTap;

  ProfileProvider({
    this.isTap = false,
  });

  void goToProfile() {
    isTap = !isTap;
    notifyListeners();
  }
}
