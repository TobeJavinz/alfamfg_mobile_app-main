import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:camera/camera.dart';
import 'login_page.dart';
import 'camera_page.dart';

class HomePage extends StatefulWidget {
  final String firstName;
  final String lastName;

  const HomePage({
    super.key,
    required this.firstName,
    required this.lastName,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int monumCount;
  late int bomCount;
  late int sonumCount;
  late int poCount;

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch initial data when widget initializes
  }

  void fetchData() async {
    // Replace with your API endpoint
    Uri url = Uri.parse('http://54.169.181.30:8000/admin/api/counts/');

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        // Parse the JSON response
        Map<String, dynamic> data = jsonDecode(response.body);
        setState(() {
          monumCount = data['monum_count'];
          bomCount = data['bom_count'];
          sonumCount = data['sonum_count'];
          poCount = data['po_count'];
        });
      } else {
        // Handle errors or fallback values
        print('Failed to load data: ${response.statusCode}');
        // Fallback values
        setState(() {
          monumCount = 0;
          bomCount = 0;
          sonumCount = 0;
          poCount = 0;
        });
      }
    } catch (e) {
      print('Error fetching data: $e');
      // Fallback values
      setState(() {
        monumCount = 0;
        bomCount = 0;
        sonumCount = 0;
        poCount = 0;
      });
    }
  }

  void _logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/logo.jpg'),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    '${widget.firstName} ${widget.lastName}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                // Handle profile navigation
              },
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Registered Users'),
              onTap: () {
                // Handle registered users navigation
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.build),
              title: const Text('Manufacturing'),
              onTap: () {
                // Handle profile navigation
              },
            ),
            ListTile(
              leading: const Icon(Icons.inventory),
              title: const Text('Inventory'),
              onTap: () {
                // Handle profile navigation
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_bag),
              title: const Text('Purchasing'),
              onTap: () {
                // Handle profile navigation
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Sales'),
              onTap: () {
                // Handle profile navigation
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () => _logout(context),
            ),
          ],
        ),
      ),
      body: Padding(
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
                      _buildCard(context, monumCount, 'MANUFACTURE ORDERS',
                          Icons.build),
                      _buildCard(context, poCount, 'PURCHASE ORDERS',
                          Icons.shopping_bag),
                      _buildCard(context, sonumCount, 'SALES ORDERS',
                          Icons.shopping_cart),
                      _buildCard(context, bomCount, 'CUSTOMERS', Icons.people),
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
                        label: const Text(''),
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
      ),
    );
  }

  Widget _buildCard(
      BuildContext context, int value, String title, IconData icon) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Tapped on $title')),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon,
                      size: 50, color: Theme.of(context).colorScheme.primary),
                  const SizedBox(width: 10),
                  Text(
                    '$value',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
