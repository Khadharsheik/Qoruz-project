import 'package:flutter/material.dart';
import 'package:qoruz_app/core/app_theme.dart';
import 'package:qoruz_app/presentation/market_place/market_place.dart';
import 'package:qoruz_app/presentation/market_place/market_place_components.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  LandingScreenState createState() => LandingScreenState();
}

class LandingScreenState extends State<LandingScreen> {
  int _currentIndex = 1;

  final List<Widget> _pages = [
    Center(child: Text("Explore", style: TextStyle(fontSize: 24))),
    MarketPlaceScreenState(),
    Center(child: Text("Search", style: TextStyle(fontSize: 24))),
    Center(child: Text("Activty", style: TextStyle(fontSize: 24))),
    Center(child: Text("Profile", style: TextStyle(fontSize: 24))),
  ];
  final List<String> _lables = [
    'Explore',
    'Marketplace',
    'Search',
    'Activity',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Container(
          height: 100,
          padding: EdgeInsets.only(
              left: 12, right: 12, bottom: 10), // Add bottom padding
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFE5F25), Color(0xFFFC3665)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // Space between elements
            crossAxisAlignment:
                CrossAxisAlignment.end, // Align items at the bottom
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _lables[_currentIndex],
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    height: 28 / 20,
                    decorationThickness: 1.5,
                    decorationStyle: TextDecorationStyle.solid,
                    color: AppColors.white,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  snackBar(context, 'You clicked menu!!');
                },
                icon: ImageIcon(
                  AssetImage(AppAssets.menuIcon),
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF0F172A),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined), label: "Explore"),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppAssets.marketPlaceIcon)),
              label: "Marketplace"),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppAssets.searchIcon)),
              label: "Search"),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppAssets.activityIcon)),
              label: "Activity"),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppAssets.profileIcon)),
              label: "Profile"),
        ],
      ),
    );
  }
}
