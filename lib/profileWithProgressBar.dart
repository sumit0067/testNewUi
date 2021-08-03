import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'circularCharts.dart';


class ProfileWithProgressBar extends StatefulWidget {
  const ProfileWithProgressBar({Key? key}) : super(key: key);

  @override
  _ProfileWithProgressBarState createState() => _ProfileWithProgressBarState();
}

class _ProfileWithProgressBarState extends State<ProfileWithProgressBar> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildCustomizedRadialBarChart());
  }

  SfCircularChart _buildCustomizedRadialBarChart() {


    return SfCircularChart(
      legend: Legend(
        isVisible: true,
        overflowMode: LegendItemOverflowMode.wrap,
        legendItemBuilder:
            (String name, dynamic series, dynamic point, int index) {
          return Container(
              height: 60,
              width: 150,
              child: Row(children: <Widget>[
                Container(
                    height: 75,
                    width: 60,
                    child: SfCircularChart(
                      series: <RadialBarSeries<ChartSampleData, String>>[
                        RadialBarSeries<ChartSampleData, String>(
                            animationDuration: 0,
                            maximumValue: 100,
                            radius: '100%',
                            cornerStyle: CornerStyle.bothCurve,
                            xValueMapper: (ChartSampleData data, _) => point.x as String,
                            yValueMapper: (ChartSampleData data, _) => data.y,
                            gap: "5",
                            pointColorMapper: (ChartSampleData data, _) => data.pointColor,
                            innerRadius: '70%',
                        )
                      ],
                    )),
                // Container(
                //     width: 72,
                //     child: Text(
                //       point.x,
                //       style: TextStyle(
                //           color: colors[index], fontWeight: FontWeight.bold),
                //     )),
              ]));
        },
      ),
      series: _getRadialBarCustomizedSeries(),
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
          angle: 0,
          radius: '01%',
          height: '90%',
          width: '90%',
          widget: Container(
            child: Image.asset(
              'assets/Shape.png',
              height: 100.0,
              width: 100.0,
            ),
          ),
        ),
      ],
    );
  }

  /// Returns radial bar which need to be customized.
  List<RadialBarSeries<ChartSampleData, String>>
  _getRadialBarCustomizedSeries() {
    final List<ChartSampleData> chartData = <ChartSampleData>[
      ChartSampleData(
          x: 'Vehicle',
          y: 62.70,
          pointColor: const Color.fromRGBO(69, 186, 161, 1.0)),

    ];
    return <RadialBarSeries<ChartSampleData, String>>[
      RadialBarSeries<ChartSampleData, String>(
        animationDuration: 0,
        maximumValue: 100,
        gap: '90%',
        radius: '80%',
        dataSource: chartData,
        cornerStyle: CornerStyle.bothCurve,
        innerRadius: '50%',
        xValueMapper: (ChartSampleData data, _) => data.x as String,
        yValueMapper: (ChartSampleData data, _) => data.y,
        //pointRadiusMapper: (ChartSampleData data, _) => '',

        /// Color mapper for each bar in radial bar series,
        /// which is get from datasource.
        pointColorMapper: (ChartSampleData data, _) => data.pointColor,
        legendIconType: LegendIconType.circle,
      ),
    ];
  }
}
