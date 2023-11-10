

import 'dart:math';

import 'package:flutter/cupertino.dart';

import 'RandomModel.dart';
import 'SuccessModel.dart';

class StatusModel with ChangeNotifier {
  SuccessModel successModel = SuccessModel();
      int getStatus = 0;
  int? get getStatusResponse => getStatus;

  void checkRandomNumber(int getChangedStatus) {
    print(getChangedStatus);
    getStatus = getChangedStatus;
    if(getStatus==1) {
      successModel.increment();
    }
    notifyListeners();
  }


}