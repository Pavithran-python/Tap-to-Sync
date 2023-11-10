import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncproject/RandomModel.dart';
import 'StatusModel.dart';
import 'SuccessBody.dart';
import 'SuccessModel.dart';

class StatusBody extends StatelessWidget {
  const StatusBody({super.key,required this.screenWidth,required this.screenHeight,required this.horizontalPadding,required this.sampleScreenWidth,required this.sampleScreenHeight, required this.statusNotifier,required this.curveRadius});
  final double screenWidth;
  final double screenHeight;
  final int horizontalPadding;
  final double sampleScreenWidth;
  final double sampleScreenHeight;
  final double curveRadius;
  final StatusModel statusNotifier;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ListenableBuilder(
            listenable: statusNotifier,
            builder: (BuildContext context, Widget? child) {
              return Container(
                width: screenWidth,
                height: screenWidth,
                margin: EdgeInsets.all(screenWidth*(horizontalPadding/sampleScreenWidth),),
                decoration: BoxDecoration(
                  color: statusNotifier.getStatus==0?Colors.amber:statusNotifier.getStatus==1?Colors.green:Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(screenWidth*(curveRadius/sampleScreenWidth))),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      blurStyle:BlurStyle.outer,
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left:screenWidth*(horizontalPadding/sampleScreenWidth),top: screenWidth*(horizontalPadding/sampleScreenWidth),right: screenWidth*(horizontalPadding/sampleScreenWidth)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text("Total success : ",textAlign: TextAlign.start,textScaler: TextScaler.linear(1.0), style: TextStyle(fontSize: screenHeight*(20/sampleScreenHeight),fontWeight: FontWeight.w500,color: Colors.white), ),
                                ),
                                SuccessBody(screenHeight: screenHeight, sampleScreenHeight: sampleScreenHeight, SuccessNotifier: statusNotifier.successModel),
                              ],
                            ),
                          ),
                          Container(
                            child: Container(
                              child: TextButton(
                                onPressed: (){
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  minimumSize: Size.zero,
                                  padding: EdgeInsets.all(7),
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: Text("View Record",textAlign: TextAlign.end,textScaler: TextScaler.linear(1.0),style: TextStyle(fontSize: screenHeight*(18/sampleScreenHeight),fontWeight: FontWeight.w600,color: Colors.white),),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: screenWidth*(40/sampleScreenWidth),
                            ),
                            Expanded(
                              child: Container(
                                child: SvgPicture.asset(statusNotifier.getStatus==0?"assets/icons/start_icon.svg":statusNotifier.getStatus==1?"assets/icons/success_icon.svg":"assets/icons/failure_icon.svg",fit: BoxFit.scaleDown,),
                              ),
                            ),
                            SizedBox(
                              height: screenWidth*(40/sampleScreenWidth),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal:screenWidth*(horizontalPadding/sampleScreenWidth)),
                              child: Text(statusNotifier.getStatus==0?"Let's Start 🚀":statusNotifier.getStatus==1?"Congratulations 🏆":"Try Again 😔",textAlign: TextAlign.center,textScaler: TextScaler.linear(1.0), style: TextStyle(fontSize: screenHeight*(25/sampleScreenHeight),fontWeight: FontWeight.w600,color: Colors.white), ),
                            ),
                            SizedBox(
                              height: screenWidth*(5/sampleScreenWidth),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal:screenWidth*(horizontalPadding/sampleScreenWidth)),
                              child: Text(statusNotifier.getStatus==0?"Tap on bottom left layout":statusNotifier.getStatus==1?"Seconds & Random number are same":"Seconds & Random number are not same",textAlign: TextAlign.center,textScaler: TextScaler.linear(1.0), style: TextStyle(fontSize: screenHeight*(20/sampleScreenHeight),fontWeight: FontWeight.w500,color: Colors.white),softWrap: true, ),
                            ),
                            SizedBox(
                              height: screenWidth*(40/sampleScreenWidth),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}