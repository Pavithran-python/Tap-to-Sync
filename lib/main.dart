import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncproject/RandomModel.dart';
import 'package:syncproject/StatusBody.dart';
import 'package:syncproject/StatusModel.dart';
import 'package:syncproject/SuccessBody.dart';
import 'package:syncproject/SuccessModel.dart';

import 'RandomBody.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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


  int? getTimeStampSecond(){
    time = DateTime.now();
    int? getSeconds = time?.second;
    print(getSeconds);
    return getSeconds;
  }

  generateRandomNumber(){
    randomNumberModel.generateRandomNumber();
    int? getCurrentSecond = getTimeStampSecond();
    print("sec : ${getCurrentSecond}, rn: ${randomNumberModel.randomNumber}");
    if(getCurrentSecond != null && getCurrentSecond == randomNumberModel.randomNumber){
      statusModel.checkRandomNumber(1);
    }
    else if(getCurrentSecond != randomNumberModel.randomNumber){
      statusModel.checkRandomNumber(2);
    }
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
          title: Text("Time Sync",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
        ),
        body: Container(
          color: Colors.white.withOpacity(0.8),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                StatusWidget(),
                Container(
                  width: screenWidth,
                  margin: EdgeInsets.symmetric(horizontal:screenWidth*(horizontalPadding/sampleScreenWidth),),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TapButtonWidget(),
                      RandomNumberWidget(),
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

  Widget StatusWidget(){
    return StatusBody(screenWidth: screenWidth, screenHeight: screenHeight, horizontalPadding: horizontalPadding, sampleScreenWidth: sampleScreenWidth, sampleScreenHeight: sampleScreenHeight, statusNotifier: statusModel, curveRadius: curveRadius);
    // return Container(
    //   width: screenWidth,
    //   height: screenWidth,
    //   margin: EdgeInsets.all(screenWidth*(horizontalPadding/sampleScreenWidth),),
    //   decoration: BoxDecoration(
    //     color: getStatus==0?Colors.amber:getStatus==1?Colors.green:Colors.red,
    //     borderRadius: BorderRadius.all(Radius.circular(screenWidth*(curveRadius/sampleScreenWidth))),
    //     boxShadow: <BoxShadow>[
    //       BoxShadow(
    //         blurStyle:BlurStyle.outer,
    //         color: Colors.grey.withOpacity(0.5),
    //         blurRadius: 5,
    //       ),
    //     ],
    //   ),
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       Container(
    //         padding: EdgeInsets.only(left:screenWidth*(horizontalPadding/sampleScreenWidth),top: screenWidth*(horizontalPadding/sampleScreenWidth),right: screenWidth*(horizontalPadding/sampleScreenWidth)),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             Container(
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.start,
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: [
    //                   Container(
    //                     child: Text("Total success : ",textAlign: TextAlign.start,textScaler: TextScaler.linear(1.0), style: TextStyle(fontSize: screenHeight*(20/sampleScreenHeight),fontWeight: FontWeight.w500,color: Colors.white), ),
    //                   ),
    //                   SuccessBody(screenHeight: screenHeight, sampleScreenHeight: sampleScreenHeight, SuccessNotifier: successCounterModel),
    //                 ],
    //               ),
    //             ),
    //             Container(
    //               child: Container(
    //                 child: TextButton(
    //                   onPressed: (){
    //                   },
    //                   style: TextButton.styleFrom(
    //                     backgroundColor: Colors.blue,
    //                     minimumSize: Size.zero,
    //                     padding: EdgeInsets.all(7),
    //                     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    //                   ),
    //                   child: Text("View Record",textAlign: TextAlign.end,textScaler: TextScaler.linear(1.0),style: TextStyle(fontSize: screenHeight*(18/sampleScreenHeight),fontWeight: FontWeight.w600,color: Colors.white),),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //       Expanded(
    //         child: Container(
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               SizedBox(
    //                 height: screenWidth*(40/sampleScreenWidth),
    //               ),
    //               Expanded(
    //                 child: Container(
    //                   child: SvgPicture.asset(getStatus==0?"assets/icons/start_icon.svg":getStatus==1?"assets/icons/success_icon.svg":"assets/icons/failure_icon.svg",fit: BoxFit.scaleDown,),
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: screenWidth*(40/sampleScreenWidth),
    //               ),
    //               Container(
    //                 padding: EdgeInsets.symmetric(horizontal:screenWidth*(horizontalPadding/sampleScreenWidth)),
    //                 child: Text(getStatus==0?"Let's Start 🚀":getStatus==1?"Congratulations 🏆":"Try Again 😔",textAlign: TextAlign.center,textScaler: TextScaler.linear(1.0), style: TextStyle(fontSize: screenHeight*(25/sampleScreenHeight),fontWeight: FontWeight.w600,color: Colors.white), ),
    //               ),
    //               SizedBox(
    //                 height: screenWidth*(5/sampleScreenWidth),
    //               ),
    //               Container(
    //                 padding: EdgeInsets.symmetric(horizontal:screenWidth*(horizontalPadding/sampleScreenWidth)),
    //                 child: Text(getStatus==0?"Tap on bottom left layout":getStatus==1?"Seconds & Random number are same":"Seconds & Random number are not same",textAlign: TextAlign.center,textScaler: TextScaler.linear(1.0), style: TextStyle(fontSize: screenHeight*(20/sampleScreenHeight),fontWeight: FontWeight.w500,color: Colors.white),softWrap: true, ),
    //               ),
    //               SizedBox(
    //                 height: screenWidth*(40/sampleScreenWidth),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
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

  Widget RandomNumberWidget(){
    return RandomBody(screenWidth: screenWidth, screenHeight: screenHeight, horizontalPadding: horizontalPadding, sampleScreenWidth: sampleScreenWidth, sampleScreenHeight: sampleScreenHeight, randomNotifier: randomNumberModel, curveRadius: curveRadius,);
  }
}
