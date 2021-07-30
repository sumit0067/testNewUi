import 'dart:async';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CustomProgress extends StatefulWidget {
  const CustomProgress({Key? key}) : super(key: key);

  @override
  _CustomProgressState createState() => _CustomProgressState();
}

class _CustomProgressState extends State<CustomProgress> {
  double _size = 150;
  late Timer _timer;
  double _value = 10;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor:Color(0xff1C2431),


      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SfRadialGauge(
                axes: <RadialAxis>[
              RadialAxis(
                  minimum: 0,
                  maximum: 100,
                  showLabels: false,
                  showTicks: false,
                  radiusFactor: 0.8,
                  axisLineStyle: const AxisLineStyle(
                    thickness: 0.2,
                    cornerStyle: CornerStyle.bothCurve,
                    color: Color(0xff312F52),
                    thicknessUnit: GaugeSizeUnit.factor,
                  ),
                  pointers: <GaugePointer>[
                    RangePointer(

                      color: Color(0xff6A40F3),
                      value: 10,
                      cornerStyle: CornerStyle.bothCurve,
                      width: 0.2,
                      sizeUnit: GaugeSizeUnit.factor,
                      enableAnimation: true,
                      animationDuration: 20,
                      animationType: AnimationType.linear,
                    )
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                        positionFactor: 0.1,
                        angle: 90,
                        widget: Stack(
                          children: [
                            Positioned(
                              top:height*0.085,
                              left: width*0.26,
                              right: width*0.26,
                              child: Image.asset('assets/image.png',
                                width: width*0.5,
                                height: height*0.2,
                                fit: BoxFit.fill,
                              ),
                            ),

                            Align(
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset('assets/Shape.png',
                                    width: MediaQuery.of(context).size.width*0.07,
                                    height: MediaQuery.of(context).size.height*0.07,
                                  ),
                                  Text(
                                    _value.toString(),
                                    style: const TextStyle(
                                        fontSize: 36,
                                        color: Colors.white,
                                      fontFamily: "NotoSans-Regular",
                                      fontWeight: FontWeight.w700
                                    ),
                                  ),
                                  Text(
                                    "kcal",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      fontFamily: "NotoSans-Regular",
                                      fontWeight: FontWeight.w400
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ))
                  ])
            ]),
          ],
        ),
      ),
    );
  }



}
