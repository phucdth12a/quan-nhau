import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationBarPage extends StatelessWidget {
  const BottomNavigationBarPage({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      resizeToAvoidBottomInset: false,

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_sharp),
            activeIcon: Icon(Icons.location_on_sharp, color: Colors.blue),
            label: 'Điểm',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add),
            activeIcon: Icon(Icons.person_add, color: Colors.blue),
            label: 'Bạn bè',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            activeIcon: Icon(Icons.person, color: Colors.blue),
            label: 'Hồ sơ',
          ),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (bottomBarIndex) {
          navigationShell.goBranch(
            bottomBarIndex,
            initialLocation: bottomBarIndex == navigationShell.currentIndex,
          );
        },
      ),
    );
  }
}
