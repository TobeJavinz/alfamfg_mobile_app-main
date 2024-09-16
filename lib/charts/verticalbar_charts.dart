import 'package:alfamfg_mobile_app/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class VerticalbarCharts extends StatelessWidget {
  const VerticalbarCharts({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: secondaryColor,
      surfaceTintColor: secondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Vertical Bar',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'Statistics of the month',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert,
                      size: 40,
                    ))
              ],
            ),
            const SizedBox(
              height: defaultPadding * 2,
            ),
            Row(
              children: [
                Container(
                  height: 13,
                  width: 27,
                  decoration: BoxDecoration(
                    color: thirdColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'Sales',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                //Spacer
                // SizedBox(width: defaultPadding,
                // ),
                // Container(
                //   height: 13,
                //   width: 27,
                //   decoration: BoxDecoration(
                //     color: thirdColor,
                //     borderRadius: BorderRadius.circular(20),
                //   ),
                // ),
                // SizedBox(width: 10,
                // ),
                // Text('Data2', style: TextStyle(
                //   color: Colors.black,
                //   fontSize: 14,
                //   fontWeight: FontWeight.w500),
                // ),
              ],
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            SfCartesianChart(
              plotAreaBackgroundColor: Colors.transparent,
              margin: const EdgeInsets.all(0),
              borderColor: Colors.transparent,
              borderWidth: 0,
              plotAreaBorderWidth: 0,
              enableSideBySideSeriesPlacement: false,
              primaryXAxis: const CategoryAxis(
                axisLine: AxisLine(width: 0.5),
                majorGridLines: MajorGridLines(width: 0),
                majorTickLines: MajorTickLines(width: 0),
                crossesAt: 0,
              ),
              primaryYAxis: const NumericAxis(
                isVisible: false,
                minimum: -1,
                maximum: 2,
                interval: 0.5,
              ),
              series: <CartesianSeries>[
                ColumnSeries<ChartColumnData, String>(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  dataSource: chartData,
                  width: 0.5,
                  color: thirdColor,
                  xValueMapper: (ChartColumnData data, _) => data.x,
                  yValueMapper: (ChartColumnData data, _) => data.y,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ChartColumnData {
  ChartColumnData(this.x, this.y);
  final String x;
  final double? y;
}

final List<ChartColumnData> chartData = <ChartColumnData>[
  ChartColumnData('Jan', 1),
  ChartColumnData('Feb', 1.5),
  ChartColumnData('Mar', 1.7),
  ChartColumnData('Apr', 1.2),
  ChartColumnData('May', 1.8),
  ChartColumnData('Jun', 1.4),
  ChartColumnData('Jul', 1.6),
  ChartColumnData('Aug', 1.3),
  ChartColumnData('Sep', 1.9),
  ChartColumnData('Oct', 1.1),
  ChartColumnData('Nov', 1.7),
  ChartColumnData('Dec', 1.5),
];
