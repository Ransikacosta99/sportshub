import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'booking_screen.dart';

class ItemScreen extends StatelessWidget {
  final List<String> imagePaths;
  final String title;
  final String location;
  final double rating;
  final String description;
  final String address;
  final String contactNo;
  final String type;
  final String priceDay;
  final String priceNight;
  final String dimensions;
  final List<Map<String, String>> reviews;

  const ItemScreen({
    Key? key,
    required this.imagePaths,
    required this.title,
    required this.location,
    required this.rating,
    required this.description,
    required this.address,
    required this.contactNo,
    required this.type,
    required this.priceDay,
    required this.priceNight,
    required this.dimensions,
    required this.reviews,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title,
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold)),
                          Text(location,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.grey)),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow[700]),
                          const SizedBox(width: 4),
                          Text(rating.toString(),
                              style: const TextStyle(fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  CarouselSlider(
                    // Use CarouselSlider
                    options: CarouselOptions(
                      height: 200.0,
                      enlargeCenterPage: true,
                      autoPlay: true, // Optional: Enable auto-play
                      aspectRatio: 16 / 9,
                      viewportFraction: 1,
                    ),
                    items: imagePaths.map((imagePath) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: const BoxDecoration(
                              color: Colors.grey, // Placeholder color
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                imagePath,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  Text(description, style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 16),
                  const Text("Details",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  _buildDetailRow("Address", address),
                  _buildDetailRow("Contact No", contactNo),
                  _buildDetailRow("Type", type),
                  _buildDetailRow("Price", "$priceDay / $priceNight"),
                  _buildDetailRow("Dimensions", dimensions),
                  const SizedBox(height: 16),
                  const Text("Reviews",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  _buildReviews(reviews),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BookingScreen()), // Navigate to BookingScreen
    );
  },
                child: const Text("Book Now"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label + ": ",
              style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  Widget _buildReviews(List<Map<String, String>> reviews) {
    return Column(
      children: reviews.map((review) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(review["user"]!,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow[700]),
                        const SizedBox(width: 4),
                        Text(review["rating"]!,
                            style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(review["comment"]!),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
