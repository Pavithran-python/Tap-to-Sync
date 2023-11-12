
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoad extends StatelessWidget {
  const ShimmerLoad({super.key,required this.screenWidth,required this.screenHeight,required this.horizontalPadding,required this.sampleScreenWidth,required this.sampleScreenHeight,required this.curveRadius});
  final double screenWidth;
  final double screenHeight;
  final int horizontalPadding;
  final double sampleScreenWidth;
  final double sampleScreenHeight;
  final double curveRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: screenWidth,
              height: screenHeight*(100/sampleScreenHeight),
              margin: EdgeInsets.symmetric(horizontal: screenWidth*(horizontalPadding/sampleScreenWidth)),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.all(Radius.circular(screenHeight*(15/sampleScreenHeight))),
              ),
            ),
            SizedBox(
              height: screenHeight*(20/sampleScreenHeight),
            ),
            Container(
              width: screenWidth,
              height: screenHeight*(100/sampleScreenHeight),
              margin: EdgeInsets.symmetric(horizontal: screenWidth*(horizontalPadding/sampleScreenWidth)),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.all(Radius.circular(screenHeight*(15/sampleScreenHeight))),
              ),
            ),
            SizedBox(
              height: screenHeight*(20/sampleScreenHeight),
            ),
            Container(
              width: screenWidth,
              height: screenHeight*(100/sampleScreenHeight),
              margin: EdgeInsets.symmetric(horizontal: screenWidth*(horizontalPadding/sampleScreenWidth)),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.all(Radius.circular(screenHeight*(15/sampleScreenHeight))),
              ),
            ),
            SizedBox(
              height: screenHeight*(20/sampleScreenHeight),
            ),
            Container(
              width: screenWidth,
              height: screenHeight*(100/sampleScreenHeight),
              margin: EdgeInsets.symmetric(horizontal: screenWidth*(horizontalPadding/sampleScreenWidth)),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.all(Radius.circular(screenHeight*(15/sampleScreenHeight))),
              ),
            ),
            SizedBox(
              height: screenHeight*(20/sampleScreenHeight),
            ),
            Container(
              width: screenWidth,
              height: screenHeight*(100/sampleScreenHeight),
              margin: EdgeInsets.symmetric(horizontal: screenWidth*(horizontalPadding/sampleScreenWidth)),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.all(Radius.circular(screenHeight*(15/sampleScreenHeight))),
              ),
            ),
            SizedBox(
              height: screenHeight*(20/sampleScreenHeight),
            ),
            Container(
              width: screenWidth,
              height: screenHeight*(100/sampleScreenHeight),
              margin: EdgeInsets.symmetric(horizontal: screenWidth*(horizontalPadding/sampleScreenWidth)),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.all(Radius.circular(screenHeight*(15/sampleScreenHeight))),
              ),
            ),
            SizedBox(
              height: screenHeight*(20/sampleScreenHeight),
            ),
            Container(
              width: screenWidth,
              height: screenHeight*(100/sampleScreenHeight),
              margin: EdgeInsets.symmetric(horizontal: screenWidth*(horizontalPadding/sampleScreenWidth)),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.all(Radius.circular(screenHeight*(15/sampleScreenHeight))),
              ),
            ),
            SizedBox(
              height: screenHeight*(20/sampleScreenHeight),
            ),
            Container(
              width: screenWidth,
              height: screenHeight*(100/sampleScreenHeight),
              margin: EdgeInsets.symmetric(horizontal: screenWidth*(horizontalPadding/sampleScreenWidth)),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.all(Radius.circular(screenHeight*(15/sampleScreenHeight))),
              ),
            ),
            SizedBox(
              height: screenHeight*(20/sampleScreenHeight),
            ),
            Container(
              width: screenWidth,
              height: screenHeight*(100/sampleScreenHeight),
              margin: EdgeInsets.symmetric(horizontal: screenWidth*(horizontalPadding/sampleScreenWidth)),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.all(Radius.circular(screenHeight*(15/sampleScreenHeight))),
              ),
            ),
            SizedBox(
              height: screenHeight*(20/sampleScreenHeight),
            ),
          ],
        ),
      ),
    );
  }
}