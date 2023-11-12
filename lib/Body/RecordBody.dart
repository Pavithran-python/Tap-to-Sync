import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncproject/Model/RandomModel.dart';
import '../Class/RecordListClass.dart';
import '../Model/SelectedModel.dart';
import '../Model/SuccessModel.dart';
import 'ShimmerLoad.dart';

class RecordBody extends StatelessWidget {
  const RecordBody({required this.screenWidth,required this.screenHeight,required this.horizontalPadding,required this.sampleScreenWidth,required this.sampleScreenHeight,required this.curveRadius,required this.selectedNotifier});
  final double screenWidth;
  final double screenHeight;
  final int horizontalPadding;
  final double sampleScreenWidth;
  final double sampleScreenHeight;
  final double curveRadius;
  final SelectedModel selectedNotifier;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ListenableBuilder(
            listenable: selectedNotifier,
            builder: (BuildContext context, Widget? child) {
              return (selectedNotifier.getLoadingFunction!)?ShimmerLoad(screenWidth: screenWidth, screenHeight: screenHeight, horizontalPadding: horizontalPadding, sampleScreenWidth: sampleScreenWidth, sampleScreenHeight: sampleScreenHeight, curveRadius: curveRadius,):(selectedNotifier.getRecordListFunction!.isEmpty)?Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight*(100/sampleScreenHeight),
                    ),
                    Container(
                      child: Text("No Records",textAlign: TextAlign.center,textScaler: TextScaler.linear(1.0),style: TextStyle(fontSize: screenHeight*(30/sampleScreenHeight),fontWeight: FontWeight.w600,color: Colors.blue),),
                    ),
                  ],
                ),
              ):Container(
                width: screenWidth,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: selectedNotifier.getRecordListFunction!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return RecordListview(selectedNotifier.getRecordListFunction![index]);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget RecordListview(RecordListClass getRecordClass){
    return Container(
      width: screenWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: screenWidth,
            margin: EdgeInsets.symmetric(horizontal: screenWidth*(horizontalPadding/sampleScreenWidth)),
            decoration: BoxDecoration(
              color: getRecordClass.recordStatus==1?Colors.green:Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(screenHeight*(15/sampleScreenHeight))),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  blurStyle:BlurStyle.outer, color: Colors.grey.withOpacity(0.5),
                  blurRadius: 5,
                ),
              ],
            ),
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight*(20/sampleScreenHeight),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: screenWidth*(horizontalPadding/sampleScreenWidth)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Text("Date : ",textAlign: TextAlign.start,textScaler: TextScaler.linear(1.0), style: TextStyle(fontSize: screenHeight*(16/sampleScreenHeight),fontWeight: FontWeight.w500,color: Colors.white), ),
                            ),
                            Container(
                              child: Text("${getRecordClass.recordDate}",textAlign: TextAlign.start,textScaler: TextScaler.linear(1.0),style: TextStyle(fontSize: screenHeight*(18/sampleScreenHeight),fontWeight: FontWeight.w600,color: Colors.white),),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Container(
                            //   child: Text("Status : ",textAlign: TextAlign.end,textScaler: TextScaler.linear(1.0), style: TextStyle(fontSize: screenHeight*(20/sampleScreenHeight),fontWeight: FontWeight.w500,color: Colors.white), ),
                            // ),
                            Container(
                              child: Text("${getRecordClass.recordStatus==1?"Success":"Failure"}",textAlign: TextAlign.end,textScaler: TextScaler.linear(1.0),style: TextStyle(fontSize: screenHeight*(18/sampleScreenHeight),fontWeight: FontWeight.w600,color: Colors.white),),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),

                SizedBox(
                  height: screenHeight*(10/sampleScreenHeight),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: screenWidth*(horizontalPadding/sampleScreenWidth)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Text("Random Number : ",textAlign: TextAlign.start,textScaler: TextScaler.linear(1.0), style: TextStyle(fontSize: screenHeight*(16/sampleScreenHeight),fontWeight: FontWeight.w500,color: Colors.white), ),
                            ),
                            Container(
                              child: Text("${getRecordClass.recordRandomNumber}",textAlign: TextAlign.start,textScaler: TextScaler.linear(1.0),style: TextStyle(fontSize: screenHeight*(18/sampleScreenHeight),fontWeight: FontWeight.w600,color: Colors.white),),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Text("Seconds : ",textAlign: TextAlign.end,textScaler: TextScaler.linear(1.0), style: TextStyle(fontSize: screenHeight*(16/sampleScreenHeight),fontWeight: FontWeight.w500,color: Colors.white), ),
                            ),
                            Container(
                              child: Text("${getRecordClass.recordSeconds}",textAlign: TextAlign.end,textScaler: TextScaler.linear(1.0),style: TextStyle(fontSize: screenHeight*(18/sampleScreenHeight),fontWeight: FontWeight.w600,color: Colors.white),),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight*(20/sampleScreenHeight),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenHeight*(20/sampleScreenHeight),
          ),
        ],
      ),
    );
  }

}