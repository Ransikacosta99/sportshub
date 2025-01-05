import 'package:flutter/material.dart';

import '../screens/item_screen.dart';

class HorizontalCardList extends StatelessWidget {
  final List<Map<String, dynamic>> cardData;

  const HorizontalCardList({Key? key, required this.cardData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> itemData = {
    "imageUrls": [ // Now imageUrls is a list
      "assets/images/g1.jpg",
      "assets/images/g2.jpg",
      "assets/images/g5.jpeg",
    ],
    "title": "CLC Basketball Hub",
    "location": "Colombo",
    "rating": 4.8,
    "description":
        "Our indoor basketball court features professional-grade flooring, top-notch hoops, and a spacious, well-lit environment, providing the perfect setting for thrilling games.",
    "address": "471 Colombo - Galle Main Rd, Colombo 00300",
    "contactNo": "078 566 7878",
    "type": "Basketball",
    "priceDay": "4500/Day",
    "priceNight": "5000/night",
    "dimensions": "94 x 50 ft",
    "reviews": [
      {
        "user": "Sahan Caldera",
        "comment":
            "Impressive basketball court! Clean, well-maintained, and friendly staff. A top-notch facility for any basketball enthusiast.",
        "rating": "5"
      },
      {
        "user": "John Doe",
        "comment": "Great court, good for a quick game.",
        "rating": "4"
      },
    ],
  };
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cardData.length,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              // Handle card tap: Navigate to ItemScreen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemScreen(
                    imagePaths: itemData["imageUrls"],
      title: itemData["title"],
      location: itemData["location"],
      rating: itemData["rating"],
      description: itemData["description"],
      address: itemData["address"],
      contactNo: itemData["contactNo"],
      type: itemData["type"],
      priceDay: itemData["priceDay"],
      priceNight: itemData["priceNight"],
      dimensions: itemData["dimensions"],
      reviews: itemData["reviews"],
                  ),
                ),
              );
            },
           child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                width: 300,
                child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox( // Added SizedBox to constrain the image height
                      height: 150, // Adjust this value as needed
                      child: Stack(
                        fit: StackFit.expand, // Important: Make Stack fill the SizedBox
                        children: [
                          Image.asset(
                            cardData[index]["image"]!,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Material( // Added Material for shadow
                              elevation: 2, // Adjust shadow elevation as needed
                              borderRadius: BorderRadius.circular(4),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.star, color: Colors.yellow, size: 16),
                                    const SizedBox(width: 2),
                                    Text(
                                      cardData[index]["rating"].toString(),
                                      style: const TextStyle(color: Colors.white, fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        cardData[index]["title"]!,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(cardData[index]["description"]!),
                    ),
                  ],
                ),
              ),
            ),
            ),
          );
        },
      ),
    );
  }
}