import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:movie_app/ui/pages/downloaded_page/download_page.dart';
import 'package:movie_app/ui/pages/profile_page/profile_page.dart';
import 'package:movie_app/ui/pages/search_page.dart';

import 'package:movie_app/utils/consts/style_const.dart';

import '../pages/homepage/home_page.dart';

class ButtonNavigation extends StatefulWidget {
  const ButtonNavigation({super.key});

  @override
  State<ButtonNavigation> createState() => _ButtonNavigationState();
}

class _ButtonNavigationState extends State<ButtonNavigation> {
  int _currentIndex = 0;

  List<Widget> pages = const [
    HomePage(),
    SearchPage(),
    DownloadPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.bgColor,
      body: pages[_currentIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(
              color: Colors.white70,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
        child: NavigationBar(
          backgroundColor: AppStyle.bgColor,
          selectedIndex: _currentIndex,
          onDestinationSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          destinations: [
            NavigationDestination(
                icon: Icon(
                  Iconsax.home,
                  size: 20,
                  color: _currentIndex == 0 ? Colors.black : Colors.grey,
                ),
                label: 'Home'),
            NavigationDestination(
                icon: Icon(
                  Iconsax.search_normal,
                  size: 20,
                  color: _currentIndex == 1 ? Colors.black : Colors.grey,
                ),
                label: 'Search'),
            NavigationDestination(
                icon: Icon(
                  Iconsax.document_download,
                  size: 20,
                  color: _currentIndex == 2 ? Colors.black : Colors.grey,
                ),
                label: 'Download'),
            NavigationDestination(
                icon: Icon(
                  Iconsax.profile_circle,
                  size: 22,
                  color: _currentIndex == 3 ? Colors.black : Colors.grey,
                ),
                label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
