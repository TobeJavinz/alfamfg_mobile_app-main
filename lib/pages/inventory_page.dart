import 'package:alfamfg_mobile_app/charts/verticalbar_charts.dart';
import 'package:alfamfg_mobile_app/charts/verticalbar_charts2.dart';
import 'package:alfamfg_mobile_app/components/constants.dart';
import 'package:flutter/material.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Inventory'),
          titleTextStyle: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 26),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              children: [
                Card(
                  color: Colors.white,
                  surfaceTintColor: secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding,
                            vertical: defaultPadding),
                        child: const Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    flex: 4,
                                    child: Column(
                                      children: [
                                        Text(
                                          'Inventory Data',
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        )
                                      ],
                                    )),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: defaultPadding),
                const VerticalbarCharts(),
                const SizedBox(height: defaultPadding),
                VerticalbarC(),
              ],
            ),
          ),
        ));
  }
}
