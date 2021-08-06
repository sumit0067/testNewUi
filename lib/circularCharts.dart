import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'model/sample_view.dart';

class CircularCharts extends StatefulWidget {


  @override
  _CircularChartsState createState() => _CircularChartsState();
}

class _CircularChartsState extends State<CircularCharts> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CircularCharts'),
      ),
        body:Container(
          alignment: Alignment.topCenter,
          height: 200,
          width: 200,
          child: SfCircularChart(
            series: _getRadialBarDefaultSeries(),
          ),
        ),
    );
  }

  List<RadialBarSeries<ChartSampleData, String>> _getRadialBarDefaultSeries() {
    final List<ChartSampleData> chartData = <ChartSampleData>[
      ChartSampleData(
          y: 10,
          pointColor: const Color.fromRGBO(248, 177, 149, 1.0)),
      ChartSampleData(
          y: 11,
          pointColor: const Color.fromRGBO(246, 114, 128, 1.0)),
      ChartSampleData(
          y: 12,
          pointColor: const Color.fromRGBO(61, 205, 171, 1.0)),
      ChartSampleData(
          y: 13,
          pointColor: const Color.fromRGBO(1, 174, 190, 1.0)),
    ];

    return <RadialBarSeries<ChartSampleData, String>>[

      RadialBarSeries<ChartSampleData, String>(
          maximumValue: 15,
          dataLabelSettings: const DataLabelSettings(
              isVisible: false, textStyle: TextStyle(fontSize: 10.0)),
          dataSource: chartData,
          cornerStyle: CornerStyle.bothCurve,
          gap: '5',
          useSeriesColor: false,
          radius: '90',
          xValueMapper: (ChartSampleData data, _) => '',
          yValueMapper: (ChartSampleData data, _) => data.y,
          pointColorMapper: (ChartSampleData data, _) => data.pointColor,
      ),
    ];
  }

}

class ChartSampleData {
  final y;
  final Color? pointColor;


  ChartSampleData(
      {
        this.y,
        this.pointColor,
        });
}