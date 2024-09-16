import 'package:alfamfg_mobile_app/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RangeCharts extends StatefulWidget {
  const RangeCharts({super.key});

  @override
  State<RangeCharts> createState() => _RangeChartsState();
}

class _RangeChartsState extends State<RangeCharts> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: secondaryColor,
      surfaceTintColor: secondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sales Statistics',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Sales Data',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )),

                // child: SvgPicture.asset('assets/icons/refresh.svg'),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert,
                      size: 40,
                    )),
              ],
            ),
            const SizedBox(
              height: defaultPadding * 2,
            ),
            const SizedBox(
              height: defaultPadding * 2,
            ),
            SfCartesianChart(
              margin: const EdgeInsets.symmetric(
                vertical: defaultPadding * 2,
                horizontal: defaultPadding / 2,
              ),
              borderWidth: 0,
              plotAreaBorderWidth: 0,
              primaryXAxis: const CategoryAxis(isVisible: false),
              primaryYAxis: NumericAxis(
                axisLine: const AxisLine(width: 0),
                majorTickLines: const MajorTickLines(width: 0),
                majorGridLines: const MajorGridLines(
                    width: 1, color: Colors.black, dashArray: <double>[5, 5]),
                numberFormat: NumberFormat.compact(),
                labelStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                minimum: 0,
                maximum: 8000,
                interval: 2000,
              ),
              series: <CartesianSeries>[
                RangeColumnSeries<ChartColumnData, String>(
                  borderRadius: BorderRadius.circular(10),
                  dataSource: chartData,
                  xValueMapper: (ChartColumnData data, _) => data.x,
                  lowValueMapper: (ChartColumnData data, _) => data.low,
                  highValueMapper: (ChartColumnData data, _) => data.high,
                  pointColorMapper: (ChartColumnData data, _) => data.color,
                )
              ],
            ),
            const SizedBox(
              height: defaultPadding,
            ),
          ],
        ),
      ),
    );
  }
}

class ChartColumnData {
  ChartColumnData(this.x, this.low, this.high, this.color);
  final String x;
  final double? low;
  final double? high;
  final Color? color;
}

final List<ChartColumnData> chartData = [
  ChartColumnData('Jan', 1000, 3000, Colors.red),
  ChartColumnData('Feb', 2000, 4000, Colors.green),
  ChartColumnData('Mar', 3000, 5000, Colors.blue),
  ChartColumnData('Apr', 4000, 6000, Colors.yellow),
  ChartColumnData('May', 5000, 7000, Colors.purple),
  ChartColumnData('Jun', 6000, 8000, Colors.orange),
];
