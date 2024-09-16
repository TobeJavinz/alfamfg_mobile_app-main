import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'home_page.dart'; // Import the HomePage
import 'user_home_page.dart'; // Import the UserHomePage

final Logger _logger = Logger('LoginPage');

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  void _login() {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    String username = _usernameController.text;
    String password = _passwordController.text;

    _logger.info('Attempting to log in with username: $username');

    _performLogin(username, password);
  }

  Future<void> _performLogin(String username, String password) async {
    final url = Uri.parse('http://54.169.181.30:8000/api/login/');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username, 'password': password}),
      );

      _logger.info('Login request status code: ${response.statusCode}');
      _logger.info('Login request body: ${response.body}');

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(response.body);
        if (responseData.containsKey('first_name') &&
            responseData.containsKey('last_name')) {
          String firstName = responseData['first_name'];
          String lastName = responseData['last_name'];
          bool isSuperUser = responseData['is_superuser'];

          if (isSuperUser) {
            _logger.info('Login successful for superuser username: $username');
            _navigateToHomePage(firstName, lastName);
          } else {
            _logger
                .info('Login successful for regular user username: $username');
            _navigateToUserHomePage(firstName, lastName);
          }
        } else {
          _logger.warning('Unexpected response format');
          _handleLoginFailure();
        }
      } else {
        _logger.warning(
            'Login request failed with status: ${response.statusCode}');
        _handleLoginFailure();
      }
    } catch (e) {
      _logger.severe('Login request error: $e');
      _handleLoginFailure();
    }
  }

  void _handleLoginFailure() {
    setState(() {
      _isLoading = false;
      _errorMessage = 'Login failed. Please try again.';
    });
  }

  void _navigateToHomePage(String firstName, String lastName) {
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(
            firstName: firstName,
            lastName: lastName,
          ),
        ),
      );
    }
  }

  void _navigateToUserHomePage(String firstName, String lastName) {
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => UserHomePage(
            firstName: firstName,
            lastName: lastName,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.topCenter,
                child: Image(
                  image: AssetImage('assets/alfamfglogo.png'),
                  height: 200,
                  width: 200,
                ),
              ),
              const SizedBox(height: 32),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              if (_isLoading) const CircularProgressIndicator(),
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    _errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              const SizedBox(height: 16),
              // ElevatedButton(
              //   onPressed: _isLoading ? null : _login,
              //   child: const Text('Login'),
              // ),
              ElevatedButton(
                onPressed: _isLoading
                    ? null
                    : () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => UserHomePage(
                                    firstName: '',
                                    lastName: '',
                                  )),
                        );
                      },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
