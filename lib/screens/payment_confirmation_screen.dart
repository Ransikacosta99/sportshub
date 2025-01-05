import 'package:flutter/material.dart';

import 'payment_screen.dart';

class PaymentConfirmationScreen extends StatelessWidget {
  final String name;
  final String mobile;
  final String place;
  final int courtId;
  final List<String> slots;
  final double total;

  const PaymentConfirmationScreen({
    super.key,
    required this.name,
    required this.mobile,
    required this.place,
    required this.courtId,
    required this.slots,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow('Name:', name),
            _buildDetailRow('Mobile:', mobile),
            _buildDetailRow('Place:', place),
            _buildDetailRow('Court Id:', courtId.toString()),
            _buildSlotsRow('Slots:', slots),
            _buildDetailRow('Total:', 'Rs. ${total.toStringAsFixed(2)}'), // Format to 2 decimal places
            const Spacer(), // Push the button to the bottom
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to a success screen or perform other actions
                    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PaymentScreen()), // Navigate to your PaymentScreen
    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Pay Now'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 10),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  Widget _buildSlotsRow(String label, List<String> values) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: values.map((value) => Text(value)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}