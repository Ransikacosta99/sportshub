import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'otp_screen.dart';
import '../widgets/custom_button.dart';
import '../utils/constants.dart';
import '../widgets/phone_input_field.dart';

class PhoneEntryScreen extends StatefulWidget {
  const PhoneEntryScreen({super.key});

  @override
  State<PhoneEntryScreen> createState() => _PhoneEntryScreenState();
}

class _PhoneEntryScreenState extends State<PhoneEntryScreen> {
  final _phoneController = TextEditingController();
  bool _isLoading = false;

  void _handleSubmit() {
    if (_phoneController.text.length == 9) {
      setState(() => _isLoading = true);
      // Simulate OTP sending
      Future.delayed(const Duration(seconds: 1), () {
        setState(() => _isLoading = false);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const OTPScreen()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Center(
                child: Container(
  width: 200,
  height: 200,
  decoration: BoxDecoration(
    color: AppColors.primary.withOpacity(0.1),
    shape: BoxShape.circle,
  ),
  child: Center( // Center the logo
    child: Image.asset( // Use Image.asset for logo
      'assets/images/logo.png',
       width: 180, // Fixed logo width (adjust as needed)
      height: 180, // Fixed logo height (adjust as needed)
      fit: BoxFit.contain, // Or BoxFit.cover if you want cropping
    ),
  ),
),
              ),
              const SizedBox(height: 40),
              Text(
                'Enter your phone number',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'We will send you a verification code',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 32),
              PhoneInputField(
                controller: _phoneController,
                onChanged: (value) => setState(() {}),
              ),
              const SizedBox(height: 24),
              CustomButton(
                onPressed: _phoneController.text.length == 9 && !_isLoading
                    ? _handleSubmit
                    : null,
                isLoading: _isLoading,
                text: 'Continue',
              ),
            ],
          ),
        ),
      ),
    );
  }
}