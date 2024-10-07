import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_page.dart'; // Ensure you use GetX if needed, but it's not required for this code.

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      // Replace `NextPage` with your actual target page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()), // Provide the target page
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Image.asset(
            'assets/images/Netflix-symbol.jpg',
            width: 200, // Set the desired width
            height: 200, // Set the desired height
          ),
        ),
      ),
    );
  }
}

