import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncproject/Model/RandomModel.dart';
import '../Model/SuccessModel.dart';

class RandomBody extends StatelessWidget {
  const RandomBody({super.key,required this.screenWidth,required this.screenHeight,required this.horizontalPadding,required this.sampleScreenWidth,required this.sampleScreenHeight, required this.randomNotifier,required this.curveRadius});
  final double screenWidth;
  final double screenHeight;
  final int horizontalPadding;
  final double sampleScreenWidth;
  final double sampleScreenHeight;
  final double curveRadius;
  final RandomModel randomNotifier;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ListenableBuilder(
            listenable: randomNotifier,
            builder: (BuildContext context, Widget? child) {
              return Container(
                width: (screenWidth-(screenWidth*(horizontalPadding*3)/sampleScreenWidth))/2,
                height: (screenWidth-(screenWidth*(horizontalPadding*3)/sampleScreenWidth))/2,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFF44C3EE),
                  borderRadius: BorderRadius.all(Radius.circular(screenWidth*(curveRadius/sampleScreenWidth))),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      blurStyle:BlurStyle.outer,
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Text("${randomNotifier.randomNumber != null?randomNotifier.randomNumber:"?"}",textAlign: TextAlign.end,textScaler: TextScaler.linear(1.0),style: TextStyle(fontSize: screenHeight*(60/sampleScreenHeight),fontWeight: FontWeight.w600,color: Colors.white),),
              );
            },
          ),
        ],
      ),
    );
  }
}