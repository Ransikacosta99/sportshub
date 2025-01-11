import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Profile',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text('Name: Kalindu Gandhara'),
            const Text('Mobile: 070 4660990'),
            const SizedBox(height: 24),
            TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: 'History'),
                Tab(text: 'Upcoming'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildBookingList(), // History List
                  _buildBookingList(), // Upcoming List
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookingList() {
    // Sample booking data (replace with your actual data)
    final List<Map<String, dynamic>> bookings = [
      {
        "hub": "CLC BasketBall hub",
        "court": "Court 1",
        "date": "15-01-2023",
        "times": ["9 AM - 10 AM", "4 PM - 5 PM"],
        "price": "Rs. 9500",
      },
      {
        "hub": "CLC BasketBall hub",
        "court": "Court 2",
        "date": "12-01-2023",
        "times": ["10 AM - 11 AM"],
        "price": "Rs. 4500",
      },
      // ... more bookings
    ];

    return ListView.builder(
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        final booking = bookings[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(booking["hub"], style: const TextStyle(fontWeight: FontWeight.bold)),
                Text("Court ${booking["court"]}"),
                Text(booking["date"]),
                ...booking["times"].map((time) => Text(time)).toList(),
                const SizedBox(height: 8),
                Text(booking["price"], style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        );
      },
    );
  }
}