
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncproject/Model/RandomModel.dart';
import 'package:syncproject/recordScreen.dart';
import '../Model/SelectedModel.dart';
import '../Model/StatusModel.dart';
import 'SuccessBody.dart';
import '../Model/SuccessModel.dart';

class SelectedBody extends StatelessWidget {
  const SelectedBody({super.key,required this.screenWidth,required this.screenHeight,required this.horizontalPadding,required this.sampleScreenWidth,required this.sampleScreenHeight, required this.selectedNotifier,required this.curveRadius});
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
             return  Container(
                width: screenWidth,
                height: screenHeight * (100 / sampleScreenHeight),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(
                        width: screenWidth *
                            (horizontalPadding / sampleScreenWidth),
                      ),
                      Container(
                        height: screenHeight * (50 / sampleScreenHeight),
                        decoration: BoxDecoration(
                          color: selectedNotifier.selectedButton == 0 ? Colors.blue : Colors
                              .white,
                          borderRadius: BorderRadius.all(Radius.circular(
                              screenHeight * (50 / sampleScreenHeight))),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              blurStyle: BlurStyle.outer,
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: TextButton(
                          onPressed: () {
                            selectedNotifier.selectedPosition(0);
                          },
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth *
                                    (horizontalPadding * 2 /
                                        sampleScreenWidth)),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            "Success", textAlign: TextAlign.center,
                            textScaler: TextScaler.linear(1.0),
                            style: TextStyle(fontSize: screenHeight *
                                (18 / sampleScreenHeight),
                              fontWeight: FontWeight.w600,
                              color: selectedNotifier.selectedButton == 0
                                  ? Colors.white
                                  : Colors.blue,),),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth *
                            (horizontalPadding / sampleScreenWidth),
                      ),
                      Container(
                        height: screenHeight * (50 / sampleScreenHeight),
                        decoration: BoxDecoration(
                          color: selectedNotifier.selectedButton == 1 ? Colors.blue : Colors
                              .white,
                          borderRadius: BorderRadius.all(Radius.circular(
                              screenHeight * (50 / sampleScreenHeight))),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              blurStyle: BlurStyle.outer,
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: TextButton(
                          onPressed: () {
                            selectedNotifier.selectedPosition(1);
                          },
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth *
                                    (horizontalPadding * 2 /
                                        sampleScreenWidth)),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            "Failure", textAlign: TextAlign.center,
                            textScaler: TextScaler.linear(1.0),
                            style: TextStyle(fontSize: screenHeight *
                                (18 / sampleScreenHeight),
                              fontWeight: FontWeight.w600,
                              color: selectedNotifier.selectedButton == 1
                                  ? Colors.white
                                  : Colors.blue,),),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth *
                            (horizontalPadding / sampleScreenWidth),
                      ),
                      Container(
                        height: screenHeight * (50 / sampleScreenHeight),
                        decoration: BoxDecoration(
                          color: selectedNotifier.selectedButton == 2 ? Colors.blue : Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(screenHeight * (50 / sampleScreenHeight))),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              blurStyle: BlurStyle.outer,
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: TextButton(
                          onPressed: () {
                            selectedNotifier.selectedPosition(2);
                          },
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth *
                                    (horizontalPadding * 2 /
                                        sampleScreenWidth)),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text("All", textAlign: TextAlign.center,
                            textScaler: TextScaler.linear(1.0),
                            style: TextStyle(fontSize: screenHeight *
                                (18 / sampleScreenHeight),
                              fontWeight: FontWeight.w600,
                              color: selectedNotifier.selectedButton == 2
                                  ? Colors.white
                                  : Colors.blue,),),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth *
                            (horizontalPadding / sampleScreenWidth),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}