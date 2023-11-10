

import 'package:flutter/cupertino.dart';

class SuccessModel with ChangeNotifier {
  int successCount = 0;
  int get getSuccessCount => successCount;

  void increment() {
    successCount += 1;
    notifyListeners();
  }
}