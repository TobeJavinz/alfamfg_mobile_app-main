import 'package:alfamfg_mobile_app/charts/horizontalbar_charts.dart';
import 'package:alfamfg_mobile_app/charts/verticalbar_charts.dart';
import 'package:alfamfg_mobile_app/components/constants.dart';
import 'package:flutter/material.dart';

class ManufacturingPage extends StatelessWidget {
  const ManufacturingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manufacturing'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              HorizontalbarC(),
              const SizedBox(height: defaultPadding),
              const VerticalbarCharts()
            ],
          ),
        ),
      ),
    );
  }
}
