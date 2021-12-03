import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:propel/theme.dart';
import 'home_page.dart';
import 'package:google_fonts/google_fonts.dart';

import 'profile.dart';
import 'rate_us.dart';
import 'rewards.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      bottomNavigationBar: buildBottomNavy(),
    );
  }

  int navBarIndex = 0;

  Widget buildBottomNavy() {
    return BottomNavyBar(
      backgroundColor: primaryColor,
      selectedIndex: navBarIndex,
      onItemSelected: (index) => setState(() {
        navBarIndex = index;
        print(navBarIndex);
      }),
      items: [
        BottomNavyBarItem(
          icon: const Icon(Icons.home),
          title: Text(
            'Home',
            style: GoogleFonts.montserrat(),
          ),
          activeColor: secondaryColor,
          inactiveColor: inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          inactiveColor: inactiveColor,
          textAlign: TextAlign.center,
          icon: const Icon(Icons.star),
          title: Text(
            'Rate Us',
            style: GoogleFonts.montserrat(),
          ),
          activeColor: secondaryColor,
        ),
        BottomNavyBarItem(
          inactiveColor: inactiveColor,
          textAlign: TextAlign.center,
          icon: const Icon(Icons.local_activity),
          title: Text(
            'Rewards',
            style: GoogleFonts.montserrat(),
          ),
          activeColor: secondaryColor,
        ),
        BottomNavyBarItem(
          inactiveColor: inactiveColor,
          textAlign: TextAlign.center,
          icon: const Icon(Icons.account_circle),
          title: Text(
            'Profile',
            style: GoogleFonts.montserrat(),
          ),
          activeColor: secondaryColor,
        ),
      ],
    );
  }

  Widget buildBody() {
    switch (navBarIndex) {
     case 0:
        return const HomePage();
      case 1:
        return const RateUs();
      case 2:
        return const Rewards();
      case 3:
        return const Profile();
      default:
        return const HomePage();
    }
  }
}
