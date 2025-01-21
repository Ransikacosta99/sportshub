import 'package:flutter/material.dart';
import '../widgets/horizontal_card_list.dart';
import './profile_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'search_screen.dart';

final focusNodeProvider = Provider((ref) => FocusNode());

List<Map<String, dynamic>> cardData = [
  {
    "imageUrls": [
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
  },
  {
    "imageUrls": [
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
  },
  {
    "imageUrls": [
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
  },
  {
    "imageUrls": [
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
  },
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // appBar: AppBar(
      //   backgroundColor: const Color(0xFF2563EB),
      //   leading: IconButton(
      //     onPressed: () {
      //       final scaffoldState = Scaffold.of(context);
      //       if (scaffoldState.isDrawerOpen) {
      //         scaffoldState.closeDrawer();
      //         _focusNode.unfocus();
      //       } else {
      //         scaffoldState.openDrawer();
      //         _focusNode.unfocus();
      //       }
      //     },
      //     icon: const Icon(Icons.menu),
      //   ),
      //   title: const Text('Home'),
      // ),
      drawer: Drawer(
        // Use the standard Flutter Drawer
        backgroundColor: canvasColor, // Set your background color
        child: ListView(
          // Use a ListView for scrollable content
          padding: EdgeInsets.zero, // Remove default padding
          children: [
            DrawerHeader(
              // Use DrawerHeader for the header
              decoration: const BoxDecoration(
                color: canvasColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  'assets/images/logo.png',
                  errorBuilder: (context, error, stackTrace) =>
                      const Text("Logo Image not found"),
                ),
              ),
            ),
            ListTile(
              // Use ListTile for each menu item
              leading: const Icon(Icons.home, color: Colors.white),
              title: const Text('Home', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Add your navigation logic here
              },
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.white),
              title:
                  const Text('Profile', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.white),
              title:
                  const Text('Settings', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Add your navigation logic here
              },
            ),
          ],
        ),
      ),
      body: _buildBody(),
      bottomNavigationBar: CurvedNavigationBar(
        index: _pageIndex,
        backgroundColor:
            const Color.fromARGB(0, 255, 0, 0), // Make background transparent
        color: const Color.fromARGB(115, 0, 0, 0), // Use your primary color
        buttonBackgroundColor: Theme.of(context).primaryColor,
        animationDuration: const Duration(milliseconds: 300),
        height: 60,
        items: const <Widget>[
          Icon(Icons.home_outlined, size: 30, color: Colors.white),
          Icon(Icons.search, size: 30, color: Colors.white), // Add explore icon
          Icon(Icons.person_outline, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          if (index != _pageIndex) {
            // Only setState if the index has changed
            setState(() {
              _pageIndex = index;
            });
          }
        },
      ),
    );
  }

  Widget _buildBody() {
    switch (_pageIndex) {
      case 0:
        return _buildHomeContent(); // Call separate function for home content
      case 1:
        return const SearchScreen(); // Explore screen
      case 2:
        return const ProfileScreen(); // Profile screen
      default:
        return Container(); // Default case
    }
  }

  Widget _buildHomeContent() {
    final _focusNode = FocusNode(); // Create FocusNode here
    final _searchController = TextEditingController();

    return GestureDetector(
      onTap: () => _focusNode.unfocus(),
      behavior: HitTestBehavior.translucent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 50, 15, 20),
            child: InkWell(
              borderRadius: BorderRadius.circular(20.0),
              onTap: () {},
              child: Ink(
                decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _searchController,
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () => _searchController.clear(),
                          )
                        : null,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 20.0),
                  ),
                  onChanged: (value) {
                    debugPrint('onChanged: $value');
                  },
                  onSubmitted: (value) {
                    FocusScope.of(context).unfocus(); // unfocus on submit
                    debugPrint('onSubmitted: $value');
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 0, 8.0, 4.0),
            child: Text(
              'For You',
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          HorizontalCardList(cardData: cardData),
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 20.0, 8.0, 4.0),
            child: Text(
              'This week\'s top 10',
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          HorizontalCardList(cardData: cardData),
        ],
      ),
    );
  }
}

const canvasColor = Color(0xFF2E2E48);
