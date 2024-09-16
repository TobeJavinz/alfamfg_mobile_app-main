import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraPage extends StatelessWidget {
  final CameraDescription camera;

  const CameraPage({super.key, required this.camera});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(camera.name), // Display the camera name in the app bar
      ),
      body: const Center(
        child: Text(
          'Camera Page Content test', // Replace with your camera page content
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
