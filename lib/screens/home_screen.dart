import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart'; 
import 'package:anim_search_bar/anim_search_bar.dart';
import '../widgets/horizontal_card_list.dart';

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
    "image": "assets/images/g1.jpg",
    "title": "CLC Basketball Hub",
    "description": "Rs. 3500/ day",
    "rating": 4.5, // Add the rating here
  },
  {
    "image": "assets/images/g2.jpg",
    "title": "Sugathadasa bay",
    "description": "Rs. 3500/ day",
    "rating": 3, // Add the rating here
  },
    {
    "image": "assets/images/g3.jpg",
    "title": "CLC Basketball Hub",
    "description": "Rs. 3500/ day",
    "rating": 5, // Add the rating here
  },
  {
    "image": "assets/images/g4.jpg",
    "title": "CLC Basketball Hub",
    "description": "Rs. 3500/ day",
    "rating": 5, // Add the rating here
  },
  {
    "image": "assets/images/g5.jpeg",
    "title": "CLC Basketball Hub",
    "description": "Rs. 3500/ day",
    "rating": 5, // Add the rating here
  },
  {
    "image": "assets/images/g6.jpg",
    "title": "CLC Basketball Hub",
    "description": "Rs. 3500/ day",
    "rating": 5, // Add the rating here
  }
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
              child: Image.asset('assets/images/logo.png'), // Replace with your logo
            ),
          );
        },
        items: [
          SidebarXItem(
            icon: Icons.home,
            label: 'Home',
          ),
          SidebarXItem(
            icon: Icons.search,
            label: 'Search',
          ),
          SidebarXItem(
            icon: Icons.settings,
            label: 'Settings',
          ),
        ],
      ),
      body: Column(
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
          const Text(
              'Book again', // The heading
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
          HorizontalCardList(cardData: cardData),
          const Text(
              'This weeks top 10', // The heading
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
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