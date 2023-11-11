

import 'package:flutter/cupertino.dart';

import '../LocalDatabase/StatusDatabase.dart';

class SuccessModel with ChangeNotifier {
  int successCount = 0;
  int get getSuccessCount => successCount;

  SuccessModel(){
    getDatabaseRecords(1);
  }

  void increment() {
    successCount += 1;
    notifyListeners();
  }


  getDatabaseRecords(int selectedMode)  async {
    var statusDatabaseHelper = StatusDatabase.instance;
    final getAllRows = await statusDatabaseHelper.getAllRecords(selectedMode);
    successCount = getAllRows.length;
    notifyListeners();
  }

}