

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';
import 'package:syncproject/Body/RecordBody.dart';
import 'package:syncproject/Body/SelectedBody.dart';
import 'package:syncproject/Model/SelectedModel.dart';

import 'Class/RecordListClass.dart';
import 'LocalDatabase/StatusDatabase.dart';

class recordScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return recordPage();
  }

}

class recordPage extends State<recordScreen>{
  double screenWidth = 0;
  double screenHeight = 0;
  double sampleScreenWidth = 430;
  double sampleScreenHeight = 932;
  int horizontalPadding = 16;
  double curveRadius = 10;
  //List<RecordListClass> getRecordClassList = [];
  //bool isLoading = false;
  SelectedModel selectedModel = SelectedModel();

  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedModel.selectedPosition(0);
  }
  
  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).padding.top;
    var bottomBarHeight = MediaQuery.of(context).padding.bottom;
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height - statusBarHeight - bottomBarHeight;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            systemOverlayStyle: SystemUiOverlayStyle(
              // Status bar color
              statusBarColor: Colors.deepOrange,
              statusBarIconBrightness: Brightness.light,
              // For Android (dark icons)
              systemNavigationBarColor: Colors.white,
              systemNavigationBarIconBrightness: Brightness.dark,
            ),
            backgroundColor: Colors.deepOrange,
            title: Text("Records", textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w700),),
          ),
          body: Container(
            color: Colors.white.withOpacity(0.8),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SelectedBody(screenWidth: screenWidth, screenHeight: screenHeight, horizontalPadding: horizontalPadding, sampleScreenWidth: sampleScreenWidth, sampleScreenHeight: sampleScreenHeight, selectedNotifier: selectedModel, curveRadius: curveRadius),
                  RecordBody(screenWidth: screenWidth, screenHeight: screenHeight, horizontalPadding: horizontalPadding, sampleScreenWidth: sampleScreenWidth, sampleScreenHeight: sampleScreenHeight, curveRadius: curveRadius,selectedNotifier: selectedModel,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}

