

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:syncproject/StatusModel.dart';

class RandomModel with ChangeNotifier {
  Random random = Random();
  StatusModel statusModel = StatusModel();
  int? randomNumber;
  int? get getRandomNumber => randomNumber;

  void generateRandomNumber() {
    randomNumber = random.nextInt(60);
    notifyListeners();
  }
}