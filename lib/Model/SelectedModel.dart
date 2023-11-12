

import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../Class/RecordListClass.dart';
import '../LocalDatabase/StatusDatabase.dart';
import 'RandomModel.dart';
import 'SuccessModel.dart';

class SelectedModel with ChangeNotifier {
  List<RecordListClass> getRecordClassList = [];
  bool isLoading = false;
  int selectedButton = 0;
  int? get getSelectedButton => selectedButton;
  bool? get getLoadingFunction => isLoading;
  List<RecordListClass>? get getRecordListFunction => getRecordClassList;

  void selectedPosition(int getSelectedPosition) {
    print(getSelectedPosition);
    selectedButton = getSelectedPosition;
    notifyListeners();
    getDatabaseRecords(selectedButton);
  }

  getDatabaseRecords(int selectedMode) async {
    isLoading = true;
    getRecordClassList.clear();
    notifyListeners();
    //await Future.delayed(Duration(seconds: 5));
    var statusDatabaseHelper = StatusDatabase.instance;
    final getAllRows = await statusDatabaseHelper.getAllRecords(selectedMode);
    int i = 0 ;
    getAllRows.forEach((element) async {
      print(element);
      getRecordClassList.add(RecordListClass(recordId: element[StatusDatabase.statusTableId], recordDate: element[StatusDatabase.statusDateTime], recordRandomNumber: element[StatusDatabase.statusRandomNumber], recordSeconds: element[StatusDatabase.statusSeconds], recordStatus: element[StatusDatabase.tapStatus]));
      if(i==(getAllRows.length-1)){
        print("last");
        print(element[StatusDatabase.statusTableId]);
        isLoading = false;
        notifyListeners();
      }
      i +=1 ;
    });
    if(getAllRows.length==0){
      isLoading = false;
      notifyListeners();
    }
  }

}