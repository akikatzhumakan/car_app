// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:practice_8_9/navigation_bar/profile/ui/page/profile_page.dart';
import 'package:practice_8_9/navigation_bar/qr/qrscan.dart';

import 'animation/animation_page.dart';
import 'home/ui/home.dart';

class NavigationnBar extends StatefulWidget {
  const NavigationnBar({super.key});

  @override
  State<NavigationnBar> createState() => _NavigationnBarState();
}

class _NavigationnBarState extends State<NavigationnBar> {
  int _currentIndex = 0;
  final ttabs = [
    ExampleListPage(),
    QrPage(),
    AnimationPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ttabs[_currentIndex],
        bottomNavigationBar: Container(
            color: Colors.black,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                child: GNav(
                  backgroundColor: Colors.black,
                  color: Colors.white,
                  activeColor: Colors.white,
                  tabBackgroundColor: Colors.grey.shade800,
                  gap: 10,
                  onTabChange: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                    if (index == 1) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QrScannPage()));
                    }
                  },
                  padding: EdgeInsets.all(16),
                  // ignore: prefer_const_literals_to_create_immutables
                  tabs: [
                    GButton(
                      icon: Icons.newspaper,
                      text: "News",
                    ),
                    GButton(
                      icon: Icons.qr_code_2,
                      text: "QR scanner",
                    ),
                    GButton(icon: Icons.animation, text: "Animation"),
                    GButton(
                      icon: Icons.man,
                      text: "Profile",
                    )
                  ],
                ))));
  }
}
