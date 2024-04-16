import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:languageapp_frontend/features/splashscreen/chat_screen.dart';
import 'package:languageapp_frontend/features/auth/presentation/view/bottom%20navigations/dashboard.dart';
import 'package:languageapp_frontend/features/auth/presentation/view/bottom%20navigations/user_profile.dart';

class BottomNavigations extends ConsumerStatefulWidget {
  const BottomNavigations({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BottomNavigationsState();
}

class _BottomNavigationsState extends ConsumerState<BottomNavigations> {
  int _selectedIndex = 0;

  List<Widget> lstBottomScreen = [
    const DashboardScreen(),
    const ChatScreen(),
    const UserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: lstBottomScreen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/home_icon.png',
              height: 30,
              width: 30,
              alignment: Alignment.center,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/chat.png',
              height: 30,
              width: 30,
              alignment: Alignment.center,
            ),
            label: "Chats",
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 240, 134, 81),
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/images_zoro.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            label: "Profile",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: const Color.fromARGB(255, 234, 96, 28),
      ),
    );
  }
}
