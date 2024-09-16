import 'package:alfamfg_mobile_app/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../components/chart_data.dart';

class VerticalbarC extends StatefulWidget {
  const VerticalbarC({super.key});

  @override
  _VerticalbarCState createState() => _VerticalbarCState();
}

class _VerticalbarCState extends State<VerticalbarC> {
  String selectedStocks = 'Dec';
  DateTime selectedDate = DateTime.now();
  List<ChartColumnData> chartData = [];

  List<String> stocks = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Dec'];

  @override
  void initState() {
    super.initState();
    chartData = dataByDate[selectedDate]?.cast<ChartColumnData>() ?? [];
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        chartData = dataByDate[selectedDate]?.cast<ChartColumnData>() ?? [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: secondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding),
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                        flex: 4,
                        child: Column(
                          children: [
                            Text(
                              'Remaining Stocks',
                              style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            )
                          ],
                        )),
                    IconButton(
                      onPressed: () => _selectDate(context),
                      icon: const Icon(Icons.calendar_today, size: 30),
                    )
                  ],
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                Text(DateFormat('yyyy-MM-dd').format(selectedDate),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500)),
                SfCartesianChart(
                  margin: const EdgeInsets.symmetric(
                    vertical: defaultPadding * 2,
                  ),
                  borderWidth: 0,
                  plotAreaBorderWidth: 0,
                  primaryXAxis: const CategoryAxis(isVisible: true),
                  primaryYAxis: const NumericAxis(
                    isVisible: true,
                    minimum: 0,
                    maximum: 50,
                    interval: 5,
                  ),
                  series: <CartesianSeries>[
                    ColumnSeries<ChartColumnData, String>(
                      dataSource: chartData,
                      width: 0.8,
                      xValueMapper: (ChartColumnData data, _) => data.x,
                      yValueMapper: (ChartColumnData data, _) => data.y,
                      pointColorMapper: (ChartColumnData data, _) {
                        if (data.y! > highThreshold) {
                          return Colors.green;
                        } else if (data.y! > midThreshold) {
                          return Colors.orange;
                        } else {
                          return Colors.red;
                        }
                      },
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 13,
                      width: 27,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'High',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    // Spacer
                    const SizedBox(
                      width: defaultPadding,
                    ),
                    Container(
                      height: 13,
                      width: 27,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Mid',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      width: defaultPadding,
                    ),
                    Container(
                      height: 13,
                      width: 27,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Low',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// class ChartColumnData {
//   ChartColumnData(this.x, this.y);
//   final String x;
//   final double? y;
// }

// final List<ChartColumnData> chartData = <ChartColumnData>[
//   ChartColumnData("Week 1", 45),
//   ChartColumnData("Week 2", 15),
//   ChartColumnData("Week 3", 40),
//   ChartColumnData("Week 4", 30),
// ];

// Define thresholds
double highThreshold = 35; // Adjust this value to change the threshold
double midThreshold = 15; // Mid threshold
