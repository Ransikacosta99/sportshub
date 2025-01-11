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
      height: 200,
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
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: SizedBox(
                width: 200,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 3.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 120,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12.0),
                                  topRight: Radius.circular(12.0),
                                ),
                                image: DecorationImage(
                                  image: AssetImage(itemData["imageUrls"][1]!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 6,
                              right: 6,
                              child: Material(
                                // Wrap the rating in a Material widget
                                elevation:
                                    2, // Add a small elevation for shadow
                                borderRadius: BorderRadius.circular(4),
                                color: Colors
                                    .transparent, // Make Material background transparent
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
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
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              itemData["title"]!,
                              style: GoogleFonts.poppins(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              itemData["priceDay"],
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
            ),
          );
        },
      ),
    );
  }
}
