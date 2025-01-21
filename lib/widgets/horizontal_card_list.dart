import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/item_screen.dart';

class HorizontalCardList extends StatelessWidget {
  final List<Map<String, dynamic>> cardData;

  const HorizontalCardList({Key? key, required this.cardData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cardData.length,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        itemBuilder: (context, index) {
          final itemData = cardData[index];

          if (itemData == null ||
              !itemData.containsKey("imageUrls") ||
              !itemData.containsKey("rating")) {
            return const Text("Data Error or Missing Rating");
          }

          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemScreen(
                    imagePaths: itemData["imageUrls"],
                    title: itemData["title"]!,
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
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: SizedBox(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image with rounded corners and elevation
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 3.0,
                      margin: EdgeInsets.zero,
                      clipBehavior: Clip.antiAlias,
                      child: SizedBox(
                        height: 150,
                        width: double.infinity,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset(
                              itemData["imageUrls"][1]!,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              top: 6,
                              right: 6,
                              child: Material(
                                elevation: 2,
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.black.withOpacity(0.5),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 2),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(Icons.star,
                                          color: Colors.yellow, size: 12),
                                      const SizedBox(width: 2),
                                      Text(
                                        (itemData["rating"] is num)
                                            ? (itemData["rating"] as num)
                                                .toStringAsFixed(1)
                                            : (double.tryParse(
                                                        itemData["rating"]
                                                            .toString()) ??
                                                    0.0)
                                                .toStringAsFixed(1),
                                        style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Title
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 6.0, top: 6, right: 6),
                      child: Text(
                        itemData["title"]!,
                        style: GoogleFonts.poppins(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    // Location
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 6.0, bottom: 6, right: 6),
                      child: Row(
                        children: [
                          Icon(Icons.location_on,
                              color: Theme.of(context).primaryColor, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            itemData["location"],
                            style: GoogleFonts.lato(
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
