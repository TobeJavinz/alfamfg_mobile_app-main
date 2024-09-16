import 'package:alfamfg_mobile_app/charts/verticalbar_charts.dart';
import 'package:alfamfg_mobile_app/components/constants.dart';
import 'package:flutter/material.dart';

class PurchasingPage extends StatelessWidget {
  const PurchasingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Purchasing'),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [VerticalbarCharts()],
          ),
        ),
      ),
    );
  }
}
