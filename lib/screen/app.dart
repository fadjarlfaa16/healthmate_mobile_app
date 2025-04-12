import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Import your separate files
import '../widgets/navbar.dart';
import './mainhome/home.dart';
import './appointment/appointment.dart';
import './newspage/news.dart';
import './profile/profile.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  // List of pages (4 pages: Home, Appointment, News, Profile)
  final List<Widget> _pages = [
    const HomePageUI(), // Page 0: Home
    const AppointmentPage(), // Page 1
    const NewsPage(), // Page 2
    const ProfilePage(), // Page 3
  ];

  // Called when a nav item is tapped; we simply setState, no sliding animation.
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  // Build the appropriate AppBar depending on the page index.
  PreferredSizeWidget _buildAppBar() {
    if (_currentIndex == 0) {
      // Page 0: Dashboard with Chat & Logout
      return AppBar(
        // leading: IconButton(
        //   icon: const Icon(Icons.chat),
        //   tooltip: 'Chat',
        //   onPressed: () {
        //     Navigator.pushNamed(context, '/chat');
        //   },
        // ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () => _logout(context),
          ),
        ],
      );
    } else if (_currentIndex == 1) {
      return AppBar(title: const Text('Appointment'));
    } else if (_currentIndex == 2) {
      return AppBar(title: const Text('News'));
    } else {
      return AppBar(title: const Text('Profile'));
    }
  }

  // Logout function (used on the first page).
  Future<void> _logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logout failed: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      // Display one of the 4 pages based on _currentIndex (no slide).
      body: _pages[_currentIndex],
      // Use your custom bottom nav bar with 4 items now.
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onItemSelected: _onItemTapped,
        items: const [
          BottomNavItem(icon: Icons.home, label: 'Home'),
          BottomNavItem(icon: Icons.calendar_month, label: 'Appointment'),
          BottomNavItem(icon: Icons.article, label: 'News'),
          BottomNavItem(icon: Icons.person, label: 'Profile'),
        ],
      ),
    );
  }
}
