import 'package:covidapp/constants.dart';
import 'package:covidapp/screens/HomePage/Components/Advice_Page.dart';
import 'package:covidapp/screens/HomePage/Components/RiskUser.dart';
import 'package:covidapp/screens/HomePage/Components/Risk_Page.dart';
import 'package:covidapp/screens/HomePage/Components/Travel_Page.dart';
import 'package:covidapp/screens/Questions_Page/Questions_Page.dart';
import 'package:covidapp/screens/Social_distance/Social_Distance.dart';
import 'package:covidapp/screens/Statistics/Statistics_Page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage_noninficted extends StatefulWidget {
  const HomePage_noninficted({Key? key}) : super(key: key);

  @override
  State<HomePage_noninficted> createState() => _HomePage_noninfictedState();
}

class _HomePage_noninfictedState extends State<HomePage_noninficted> {
  int _currentIndex = 0;

  List screens = [
    Advice_Page(),
    Risk_Page(),
    Health(),
    Travel_Page(),
    Statistics_Page(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kMainColor,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.group,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          actions: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Questions_Page()));
                    },
                    icon: Icon(
                      FontAwesomeIcons.question,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Social_Distance()));
                    },
                    icon: Icon(
                      Icons.social_distance,
                      color: Colors.white,
                    )),
              ],
            )
          ],
        ),
        body: screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 30,
          selectedItemColor: kMainColor,
          unselectedItemColor: Colors.grey,
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Advices'),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.dangerous,
              ),
              label: 'Risk',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.health_and_safety,
              ),
              label: 'Health',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.travel_explore,
              ),
              label: 'Travel',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.analytics), label: 'Statitks'),
          ],
        ));
  }
}
