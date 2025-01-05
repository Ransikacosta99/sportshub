import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'payment_confirmation_screen.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime? _selectedDate;
  String? _selectedCourt = 'Court 1';
  final List<String> _courts = ['Court 1', 'Court 2', 'Court 3'];

  final Map<String, List<BookingSlot>> _slots = {
    'Court 1': [
      BookingSlot('9 AM - 10 AM', 4500, 'day'),
      BookingSlot('1 PM - 2 PM', 4500, 'day'),
      BookingSlot('2 PM - 3 PM', 4500, 'day'),
      BookingSlot('3 PM - 4 PM', 4500, 'day'),
      BookingSlot('5 PM - 6 PM', 5000, 'night'),
      BookingSlot('6 PM - 7 PM', 5000, 'night'),
      BookingSlot('8 PM - 9 PM', 5000, 'night'),
      BookingSlot('9 PM - 10 PM', 5000, 'night'),
    ],
    'Court 2': [
      BookingSlot('9 AM - 10 AM', 3500, 'day'),
      BookingSlot('1 PM - 2 PM', 3500, 'day'),
       BookingSlot('6 PM - 7 PM', 4000, 'night'),
    ],
    'Court 3': [
      BookingSlot('10 AM - 11 AM', 4000, 'day'),
      BookingSlot('4 PM - 5 PM', 4000, 'day'),
       BookingSlot('7 PM - 8 PM', 4500, 'night'),
    ],
  };

  List<BookingSlot> _selectedSlots = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold( // You might remove Scaffold if it's already in your parent widget
      appBar: AppBar( // You might remove AppBar if it's already in your parent widget or not needed
        title: const Text('CLC Basketball Hub'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Select a booking date'),
            Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedDate != null
                        ? DateFormat('dd-MM-yyyy').format(_selectedDate!)
                        : 'No date selected',
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (picked != null && picked != _selectedDate) {
                      setState(() {
                        _selectedDate = picked;
                      });
                    }
                  },
                ),
              ],
            ),
            DropdownButtonFormField<String>(
              value: _selectedCourt,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCourt = newValue!;
                });
              },
              items: _courts.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            if (_selectedDate == null)
              const Center(child: Text('Please select a date'))
            else
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSlotSection('Day',
                          _slots[_selectedCourt]?.where((slot) => slot.type == 'day').toList() ?? []),
                      _buildSlotSection('Night',
                          _slots[_selectedCourt]?.where((slot) => slot.type == 'night').toList() ?? []),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 20),
            Text('Total: Rs. ${_selectedSlots.fold<int>(0, (previousValue, element) => previousValue + element.price)}.00'),
            Center(
              child: ElevatedButton(
                onPressed: _selectedDate == null ? null : () {
  if (_selectedSlots.isNotEmpty) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentConfirmationScreen(
          name: 'Kalindu Gandhara', // Replace with actual user data
          mobile: '070 4660990', // Replace with actual user data
          place: 'CLC Basketball Hub',
          courtId: 3, // Or get the actual court ID
          slots: _selectedSlots.map((slot) => slot.time).toList(),
          total: _selectedSlots.fold<double>(0, (previousValue, element) => previousValue + element.price).toDouble(),
        ),
      ),
    );
  } else {
    // Handle no slots selected
    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please select at least one slot')),
                    );
  }
},
                child: const Text('Proceed'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSlotSection(String title, List<BookingSlot> slots) {
    if (slots.isEmpty) {
      return const SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: slots.length,
          itemBuilder: (context, index) {
            final slot = slots[index];
            bool isSelected = _selectedSlots.contains(slot);
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (isSelected) {
                    _selectedSlots.remove(slot);
                  } else {
                    _selectedSlots.add(slot);
                  }
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue : Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(slot.time),
                      Text('Rs. ${slot.price}'),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class BookingSlot {
  final String time;
  final int price;
  final String type;

  BookingSlot(this.time, this.price, this.type);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookingSlot &&
          runtimeType == other.runtimeType &&
          time == other.time &&
          price == other.price &&
          type == other.type;

  @override
  int get hashCode => time.hashCode ^ price.hashCode ^ type.hashCode;
}