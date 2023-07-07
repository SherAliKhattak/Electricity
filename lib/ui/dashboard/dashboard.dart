import 'package:electricity/ui/common/colors.dart';
import 'package:electricity/ui/common/images.dart';
import 'package:electricity/ui/dashboard/home/home_screen.dart';
import 'package:electricity/ui/dashboard/profile/profile_screen.dart';
import 'package:electricity/ui/dashboard/weather/weather_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> dashboard = <Widget>[
    HomeScreen(),
    WeatherScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: dashboard.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: _selectedIndex == 1 ? kblackColor : ksecondaryColor,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: BottomNavigationBar(
            backgroundColor: kprimaryColor1,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Image.asset(
                  Images.schedule,
                  height: Get.height * .04,
                  color: _selectedIndex == 0 ? kprimaryColor : ksecondaryColor,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  Images.weather,
                  height: Get.height * .04,
                  color: _selectedIndex == 1 ? kprimaryColor : ksecondaryColor,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  Images.profile,
                  height: Get.height * .04,
                  color: _selectedIndex == 2 ? kprimaryColor : ksecondaryColor,
                ),
                label: '',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: kprimaryColor,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
