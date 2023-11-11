

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:syncproject/Model/StatusModel.dart';

class RandomModel with ChangeNotifier {
  Random random = Random();
  int? randomNumber;
  int? get getRandomNumber => randomNumber;

  void generateRandomNumber() {
    randomNumber = random.nextInt(60);
    notifyListeners();
  }
}