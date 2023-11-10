

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SuccessModel.dart';


class SuccessBody extends StatelessWidget {
  const SuccessBody({super.key,required this.screenHeight,required this.sampleScreenHeight, required this.SuccessNotifier});
  final double screenHeight;
  final double sampleScreenHeight;
  final SuccessModel SuccessNotifier;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ListenableBuilder(
            listenable: SuccessNotifier,
            builder: (BuildContext context, Widget? child) {
              return Container(
                child: Text("${SuccessNotifier.getSuccessCount}",textAlign: TextAlign.start,textScaler: TextScaler.linear(1.0),style: TextStyle(fontSize: screenHeight*(22/sampleScreenHeight),fontWeight: FontWeight.w600,color: Colors.white),),
              );
            },
          ),
        ],
      ),
    );
  }
}