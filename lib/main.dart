// lib/main.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sphub/screens/item_screen.dart';
import 'screens/phone_entry_screen.dart';
import 'screens/home_screen.dart';
import 'screens/payment_screen.dart';
import 'screens/booking_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modern Auth UI',
      theme: ThemeData(
        primaryColor: const Color(0xFF2563EB),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2563EB),
          background: Colors.white,
        ),
        textTheme: GoogleFonts.montserratTextTheme(
          // Apply Montserrat globally
          ThemeData.light().textTheme, // Use a light theme as a base
        ),
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
