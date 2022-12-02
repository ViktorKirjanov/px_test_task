import 'package:flutter/material.dart';
import 'package:px_test_task/config/custom_theme.dart';
import 'package:px_test_task/screens/home_screen/_widgets/bottom_navigation_icon.dart';
import 'package:px_test_task/screens/home_screen/collection_screen/collection_screen.dart';
import 'package:px_test_task/screens/home_screen/scan_screen/scan_screen.dart';
import 'package:px_test_task/screens/home_screen/settings_screen/settings_screen.dart';
import 'package:px_test_task/screens/home_screen/shop_screen/shop_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _selectedIndex = 1;

  final _pages = [
    const ScanScreen(),
    const CollectionScreen(),
    const ShopScreen(),
    const SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: Container(
          color: CustomTheme.black3,
          child: SafeArea(
            child: SizedBox(
              height: 80.0,
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: BottomNavigationIcon(
                      isSelected: _selectedIndex == 0,
                      svgPath: 'assets/svg/scan.svg',
                    ),
                    label: 'Scan',
                  ),
                  BottomNavigationBarItem(
                    icon: BottomNavigationIcon(
                      isSelected: _selectedIndex == 1,
                      svgPath: 'assets/svg/squares.svg',
                    ),
                    label: 'Collection',
                  ),
                  BottomNavigationBarItem(
                    icon: BottomNavigationIcon(
                      isSelected: _selectedIndex == 2,
                      svgPath: 'assets/svg/bottle.svg',
                    ),
                    label: 'Shop',
                  ),
                  BottomNavigationBarItem(
                    icon: BottomNavigationIcon(
                      isSelected: _selectedIndex == 3,
                      svgPath: 'assets/svg/gears.svg',
                    ),
                    label: 'Settings',
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
