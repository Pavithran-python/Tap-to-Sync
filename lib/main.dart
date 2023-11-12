import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncproject/LocalDatabase/StatusDatabase.dart';
import 'package:syncproject/Model/RandomModel.dart';
import 'package:syncproject/Body/StatusBody.dart';
import 'package:syncproject/Model/StatusModel.dart';
import 'package:syncproject/Body/SuccessBody.dart';
import 'package:syncproject/Model/SuccessModel.dart';
import 'package:intl/intl.dart';
import 'Body/RandomBody.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double screenWidth = 0;
  double screenHeight = 0;
  double sampleScreenWidth = 430;
  double sampleScreenHeight = 932;

  //int verticalPadding = 10;
  int horizontalPadding = 16;
  double curveRadius = 10;
  RandomModel randomNumberModel = RandomModel();
  StatusModel statusModel = StatusModel();
  DateTime? time;

  generateRandomNumber(){
    randomNumberModel.generateRandomNumber();
    time = DateTime.now();
    int? getCurrentSecond = time?.second;
    String dateFormat = DateFormat("MMM dd,yyyy HH:mm:ss aa").format(time!);
    print("sec : ${getCurrentSecond}, rn: ${randomNumberModel.randomNumber}");
    if(getCurrentSecond != null && getCurrentSecond == randomNumberModel.randomNumber){
      statusModel.checkRandomNumber(1);
      saveData(dateFormat, getCurrentSecond, randomNumberModel.randomNumber!, 1);
    }
    else if(getCurrentSecond != randomNumberModel.randomNumber){
      statusModel.checkRandomNumber(2);
      saveData(dateFormat, getCurrentSecond!, randomNumberModel.randomNumber!, 2);
    }
  }

  saveData(String selectedDate,int seconds, int randomNumber,int getStatus) async {
    var statusDatabaseHelper = StatusDatabase.instance;
    Map<String, dynamic> statusRow = {
      StatusDatabase.statusDateTime : selectedDate.toString(),
      StatusDatabase.statusRandomNumber : randomNumber,
      StatusDatabase.statusSeconds : seconds,
      StatusDatabase.tapStatus : getStatus,
    };
    final getTableId = await statusDatabaseHelper.saveRecords(statusRow);
    print(getTableId);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).padding.top;
    var bottomBarHeight = MediaQuery.of(context).padding.bottom;
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height-statusBarHeight-bottomBarHeight;
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: Colors.deepOrange,
            statusBarIconBrightness: Brightness.light,// For Android (dark icons)
            systemNavigationBarColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: Colors.deepOrange,
          title: Text("Tap to Sync",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
        ),
        body: Container(
          color: Colors.white.withOpacity(0.8),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                StatusBody(screenWidth: screenWidth, screenHeight: screenHeight, horizontalPadding: horizontalPadding, sampleScreenWidth: sampleScreenWidth, sampleScreenHeight: sampleScreenHeight, statusNotifier: statusModel, curveRadius: curveRadius,context: context,),
                Container(
                  width: screenWidth,
                  margin: EdgeInsets.symmetric(horizontal:screenWidth*(horizontalPadding/sampleScreenWidth),),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TapButtonWidget(),
                      RandomBody(screenWidth: screenWidth, screenHeight: screenHeight, horizontalPadding: horizontalPadding, sampleScreenWidth: sampleScreenWidth, sampleScreenHeight: sampleScreenHeight, randomNotifier: randomNumberModel, curveRadius: curveRadius,),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenWidth*(horizontalPadding/sampleScreenWidth),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget TapButtonWidget(){
    return Container(
      width: (screenWidth-(screenWidth*(horizontalPadding*3)/sampleScreenWidth))/2,
      height: (screenWidth-(screenWidth*(horizontalPadding*3)/sampleScreenWidth))/2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(screenWidth*(curveRadius/sampleScreenWidth))),
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurStyle:BlurStyle.outer, color: Colors.grey.withOpacity(0.5),
            blurRadius: 5,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: (){
          print("click");
          generateRandomNumber();
        },
        style: ElevatedButton.styleFrom(
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(screenWidth*(curveRadius/sampleScreenWidth))),
          ),
        ),
        child: ClipRRect(
          child: SvgPicture.asset("assets/icons/tap_image.svg",fit: BoxFit.scaleDown,),
          borderRadius: BorderRadius.all(Radius.circular(screenWidth*(curveRadius/sampleScreenWidth))),
        ),
      ),
    );
  }

}
