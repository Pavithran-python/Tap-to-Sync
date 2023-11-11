

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  int selectedButton = 0;
  List<RecordListClass> getRecordClassList = [];
  bool isLoading = false;
  
  getDatabaseRecords(int selectedMode) async {
    setState(() {
      selectedButton = selectedMode;
      isLoading = true;
    });
    //await Future.delayed(Duration(seconds: 5));
    var statusDatabaseHelper = StatusDatabase.instance;
    final getAllRows = await statusDatabaseHelper.getAllRecords(selectedMode);
    setState(() {
      getRecordClassList.clear();
      isLoading = false;
    });
    getAllRows.forEach((element) async {
      print(element);
      setState(() {
        getRecordClassList.add(RecordListClass(recordId: element[StatusDatabase.statusTableId], recordDate: element[StatusDatabase.statusDateTime], recordRandomNumber: element[StatusDatabase.statusRandomNumber], recordSeconds: element[StatusDatabase.statusSeconds], recordStatus: element[StatusDatabase.tapStatus]));
      });
    });
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDatabaseRecords(0);
    /*setState(() {
      getRecordClassList.add(RecordListClass(recordId: 1, recordDate: "12/11/2023 02:37:45 AM", recordRandomNumber: 45, recordSeconds: 45, recordStatus: 1));
      getRecordClassList.add(RecordListClass(recordId: 2, recordDate: "12/11/2023 02:38:40 AM", recordRandomNumber: 14, recordSeconds: 40, recordStatus: 2));
      getRecordClassList.add(RecordListClass(recordId: 3, recordDate: "12/11/2023 02:39:42 AM", recordRandomNumber: 50, recordSeconds: 42, recordStatus: 2));
      getRecordClassList.add(RecordListClass(recordId: 4, recordDate: "12/11/2023 02:50:12 AM", recordRandomNumber: 12, recordSeconds: 12, recordStatus: 1));
      getRecordClassList.add(RecordListClass(recordId: 5, recordDate: "12/11/2023 02:53:55 AM", recordRandomNumber: 55, recordSeconds: 55, recordStatus: 1));
      getRecordClassList.add(RecordListClass(recordId: 6, recordDate: "12/11/2023 02:59:32 AM", recordRandomNumber: 18, recordSeconds: 32, recordStatus: 2));
      getRecordClassList.add(RecordListClass(recordId: 7, recordDate: "12/11/2023 03:01:12 AM", recordRandomNumber: 58, recordSeconds: 12, recordStatus: 2));
      getRecordClassList.add(RecordListClass(recordId: 8, recordDate: "12/11/2023 03:01:18 AM", recordRandomNumber: 18, recordSeconds: 18, recordStatus: 1));
      getRecordClassList.add(RecordListClass(recordId: 9, recordDate: "12/11/2023 03:06:25 AM", recordRandomNumber: 45, recordSeconds: 25, recordStatus: 2));
      getRecordClassList.add(RecordListClass(recordId: 10, recordDate: "12/11/2023 03:10:07 AM", recordRandomNumber: 07, recordSeconds: 07, recordStatus: 1));
    });*/
  }
  
  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).padding.top;
    var bottomBarHeight = MediaQuery.of(context).padding.bottom;
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height-statusBarHeight-bottomBarHeight;
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
              statusBarIconBrightness: Brightness.light,// For Android (dark icons)
              systemNavigationBarColor: Colors.white,
              systemNavigationBarIconBrightness: Brightness.dark,
            ),
            backgroundColor: Colors.deepOrange,
            title: Text("Records",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
          ),
          body: Container(
            color: Colors.white.withOpacity(0.8),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: screenWidth,
                    height: screenHeight*(100/sampleScreenHeight),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            width: screenWidth*(horizontalPadding/sampleScreenWidth),
                          ),
                          Container(
                            height: screenHeight*(50/sampleScreenHeight),
                            decoration: BoxDecoration(
                              color: selectedButton==0?Colors.blue:Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(screenHeight*(50/sampleScreenHeight))),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  blurStyle:BlurStyle.outer, color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: TextButton(
                              onPressed: (){
                                getDatabaseRecords(0);
                              },
                              style: TextButton.styleFrom(
                                minimumSize: Size.zero,
                                padding: EdgeInsets.symmetric(horizontal: screenWidth*(horizontalPadding*2/sampleScreenWidth)),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text("All",textAlign: TextAlign.center,textScaler: TextScaler.linear(1.0),style: TextStyle(fontSize: screenHeight*(18/sampleScreenHeight),fontWeight: FontWeight.w600,color: selectedButton==0?Colors.white:Colors.blue,),),
                            ),
                          ),
                          SizedBox(
                            width: screenWidth*(horizontalPadding/sampleScreenWidth),
                          ),
                          Container(
                            height: screenHeight*(50/sampleScreenHeight),
                            decoration: BoxDecoration(
                              color: selectedButton==1?Colors.blue:Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(screenHeight*(50/sampleScreenHeight))),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  blurStyle:BlurStyle.outer, color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: TextButton(
                              onPressed: (){
                                getDatabaseRecords(1);
                              },
                              style: TextButton.styleFrom(
                                minimumSize: Size.zero,
                                padding: EdgeInsets.symmetric(horizontal: screenWidth*(horizontalPadding*2/sampleScreenWidth)),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text("Success",textAlign: TextAlign.center,textScaler: TextScaler.linear(1.0),style: TextStyle(fontSize: screenHeight*(18/sampleScreenHeight),fontWeight: FontWeight.w600,color: selectedButton==1?Colors.white:Colors.blue,),),
                            ),
                          ),
                          SizedBox(
                            width: screenWidth*(horizontalPadding/sampleScreenWidth),
                          ),
                          Container(
                            height: screenHeight*(50/sampleScreenHeight),
                            decoration: BoxDecoration(
                              color: selectedButton==2?Colors.blue:Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(screenHeight*(50/sampleScreenHeight))),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  blurStyle:BlurStyle.outer, color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: TextButton(
                              onPressed: (){
                                getDatabaseRecords(2);
                              },
                              style: TextButton.styleFrom(
                                minimumSize: Size.zero,
                                padding: EdgeInsets.symmetric(horizontal: screenWidth*(horizontalPadding*2/sampleScreenWidth)),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text("Failure",textAlign: TextAlign.center,textScaler: TextScaler.linear(1.0),style: TextStyle(fontSize: screenHeight*(18/sampleScreenHeight),fontWeight: FontWeight.w600,color: selectedButton==2?Colors.white:Colors.blue,),),
                            ),
                          ),
                          SizedBox(
                            width: screenWidth*(horizontalPadding/sampleScreenWidth),
                          ),
                        ],
                      ),
                    ),
                  ),

                  isLoading?Center(child: CircularProgressIndicator(),):getRecordClassList.length==0?Container(
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
                      itemCount: getRecordClassList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return RecordListview(getRecordClassList[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
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
                  height: screenHeight*(10/sampleScreenHeight),
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

class RecordListClass{
  int recordId;
  String recordDate;
  int recordRandomNumber;
  int recordSeconds;
  int recordStatus;
  
  RecordListClass({
    required this.recordId,
    required this.recordDate,
    required this.recordRandomNumber,
    required this.recordSeconds,
    required this.recordStatus
  });
}