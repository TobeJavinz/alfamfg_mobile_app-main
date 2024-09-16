import 'package:alfamfg_mobile_app/camera_page.dart';
import 'package:alfamfg_mobile_app/charts/horizontalbar_charts.dart';
import 'package:alfamfg_mobile_app/charts/range_charts.dart';
import 'package:alfamfg_mobile_app/charts/verticalbar_charts.dart';
import 'package:alfamfg_mobile_app/charts/verticalbar_charts2.dart';
import 'package:alfamfg_mobile_app/components/constants.dart';
import 'package:alfamfg_mobile_app/components/sidebar.dart';
import 'package:alfamfg_mobile_app/pages/inventory_page.dart';
import 'package:alfamfg_mobile_app/pages/manufacturing_page.dart';
import 'package:alfamfg_mobile_app/pages/purchasing_page.dart';
import 'package:alfamfg_mobile_app/pages/sales_page.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

class UserHomePage extends StatelessWidget {
  UserHomePage(
      {super.key, required String firstName, required String lastName});

  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        canvasColor: canvasColor,
        scaffoldBackgroundColor: white,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: Colors.black,
            fontSize: 46,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      home: Builder(
        builder: (context) {
          final isSmallScreen = MediaQuery.of(context).size.width < 600;
          return Scaffold(
            key: _key,
            appBar: isSmallScreen
                ? AppBar(
                    backgroundColor: canvasColor,
                    title: Text(_getTitleByIndex(_controller.selectedIndex)),
                    leading: IconButton(
                      onPressed: () {
                        // if (!Platform.isAndroid && !Platform.isIOS) {
                        //   _controller.setExtended(true);
                        // }
                        _key.currentState?.openDrawer();
                      },
                      icon: const Icon(Icons.menu),
                    ),
                  )
                : null,
            drawer: AlfaSidebarX(controller: _controller),
            body: Row(
              children: [
                if (!isSmallScreen) AlfaSidebarX(controller: _controller),
                Expanded(
                  child: Center(
                    child: _Homepage(
                      controller: _controller,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Diri na ang content per page

class _Homepage extends StatelessWidget {
  const _Homepage({
    required this.controller,
  });

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final pageTitle = _getTitleByIndex(controller.selectedIndex);
        switch (controller.selectedIndex) {
          // when click ang home
          case 1:
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          children: [
                            _buildCard(
                                context, 'Manufacturing', Icons.build, 2),
                            _buildCard(
                                context, 'Inventory', Icons.inventory, 3),
                            _buildCard(
                                context, 'Purchasing', Icons.shopping_bag, 4),
                            _buildCard(
                                context, 'Sales', Icons.shopping_cart, 5),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 16.0,
                    right: 16.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: ButtonBar(
                          alignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton.icon(
                              icon: const Icon(Icons.camera),
                              label: const Text('Open Camera'),
                              onPressed: () {
                                _openCameraPage(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          case 2:
            return Scaffold(
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

          case 3:
            return Scaffold(
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
              ),
            );
          case 4:
            return const Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Column(
                    children: [
                      VerticalbarCharts(),
                      SizedBox(height: defaultPadding),
                      RangeCharts(),
                    ],
                  ),
                ),
              ),
            );
          case 5:
            return const Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Column(
                    children: [
                      VerticalbarCharts(),
                      SizedBox(height: defaultPadding),
                      RangeCharts(),
                    ],
                  ),
                ),
              ),
            );
          default:
            return Text(
              pageTitle,
              style: theme.textTheme.headlineSmall,
            );
        }
      },
    );
  }

  // mga class sa userhomepage
  void _openCameraPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CameraPage(
          camera: CameraDescription(
            name: 'Default Camera',
            lensDirection: CameraLensDirection.front,
            sensorOrientation: 0,
          ),
        ),
      ),
    );
  }

  void navigateToPage(BuildContext context, String page) {
    Widget pageWidget;
    switch (page) {
      case 'Manufacturing':
        pageWidget = const ManufacturingPage();
        break;
      case 'Inventory':
        pageWidget = const InventoryPage();
        break;
      case 'Purchasing':
        pageWidget = const PurchasingPage();
        break;
      case 'Sales':
        pageWidget = const SalesPage();
        break;
      default:
        // Show an error or handle the case where page is not found
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Page not found: $page')),
        );
        return; // Exit the method if no valid page is found
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => pageWidget),
    );
  }

  // buildcard design
  Widget _buildCard(
      BuildContext context, String title, IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        controller.selectIndex(index); // This updates the selected index
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String _getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Profile';
    case 1:
      return 'Home';
    case 2:
      return 'Manufacturing';
    case 3:
      return 'Inventory';
    case 4:
      return 'Purchasing';
    case 5:
      return 'Sales';
    case 6:
      return 'Logout';
    default:
      return 'Not found page';
  }
}
