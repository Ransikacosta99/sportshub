import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import '../widgets/horizontal_card_list.dart';
import './profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();
  TextEditingController _searchController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        backgroundColor: const Color(0xFF2563EB),
        leading: IconButton(
          onPressed: () {
            if (_key.currentState != null) {
              if (_key.currentState!.isDrawerOpen) {
                _key.currentState!.closeDrawer();
              } else {
                _key.currentState!.openDrawer();
              }
            }
          },
          icon: const Icon(Icons.menu),
        ),
        title: const Text('Home'),
      ),
      drawer: SidebarX(
        controller: _controller,
        theme: SidebarXTheme(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: canvasColor,
          ),
          textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
          selectedTextStyle: const TextStyle(color: Colors.white),
          itemTextPadding: const EdgeInsets.only(left: 30),
          selectedItemTextPadding: const EdgeInsets.only(left: 30),
          itemPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        ),
        extendedTheme: const SidebarXTheme(
          width: 200,
          decoration: BoxDecoration(
            color: canvasColor,
          ),
        ),
        footerDivider: Divider(color: Colors.white.withOpacity(0.3), height: 1),
        headerBuilder: (context, extended) {
          return SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                  'assets/images/logo.png'), // Replace with your logo
            ),
          );
        },
        items: [
          SidebarXItem(
            icon: Icons.home,
            label: 'Home',
          ),
          SidebarXItem(
            icon: Icons.person,
            label: 'Profile',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
          SidebarXItem(
            icon: Icons.settings,
            label: 'Settings',
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimSearchBar(
              width: MediaQuery.of(context).size.width - 16,
              textController: _searchController,
              onSuffixTap: () {
                setState(() {
                  _searchController.clear();
                });
              },
              onSubmitted: (String value) {
                debugPrint('onSubmitted: $value');
              },
              closeSearchOnSuffixTap: true,
            ),
          ),
          const Padding(
            // Combined padding
            padding: EdgeInsets.fromLTRB(18.0, 0, 8.0, 4),
            child: Text(
              'For You',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          HorizontalCardList(cardData: cardData),
          const Padding(
            // Combined padding
            padding: EdgeInsets.fromLTRB(18.0, 20, 8.0, 4),
            child: Text(
              'This weeks top 10',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          HorizontalCardList(cardData: cardData),
        ],
      ),
    );
  }
}

const canvasColor = Color(0xFF2E2E48);
