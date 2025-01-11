import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate a delay (e.g., for data loading)
    Future.delayed(const Duration(seconds: 2), () {
      // Navigate to the next screen
      Navigator.pushReplacementNamed(
          context, '/home'); // Replace '/home' with your route
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Customize background color
      body: Center(
        child: Lottie.asset(
          'assets/splash_animation.json', // Path to your JSON file
          width: 300, // Adjust width as needed
          height: 300, // Adjust height as needed
          fit: BoxFit.contain, // Adjust fit as needed
        ),
      ),
    );
  }
}
