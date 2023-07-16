import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class FunnelChart extends StatefulWidget {
  const FunnelChart({Key? key}) : super(key: key);

  @override
  State<FunnelChart> createState() => _FunnelChartState();
}

class _FunnelChartState extends State<FunnelChart> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('Jan', 35),
      ChartData('Feb', 28),
      ChartData('Mar', 34),
      ChartData('Apr', 32),
      ChartData('May', 40)
    ];



      return Scaffold(
          body: Center(
              child: Column(

                children: [
                  Text("Prospect Convertion Funnel"),
                  Container(
                      child: SfFunnelChart(
                          series:FunnelSeries<ChartData, String>(
                              dataSource: chartData,
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y
                          )
                      )
                  ),
                ],
              )
          )
      );
    }

}


class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}