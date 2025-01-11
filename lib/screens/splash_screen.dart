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
    Future.delayed(const Duration(milliseconds: 2500), () {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/splash_animation.json',
              width: 300,
              height: 300,
              fit: BoxFit.contain,
            ),
            // const SizedBox(height: 10),
            Image.asset(
              'assets/images/logo.png', // Path to your logo image
              width: 200, // Adjust width as needed
              height: 200, // Adjust height as needed
              fit: BoxFit.contain, // Adjust fit as needed
            ),
          ],
        ),
      ),
    );
  }
}
