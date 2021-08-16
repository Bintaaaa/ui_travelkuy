import 'package:basic_implement_ui_3/constans/color_constans.dart';
import 'package:basic_implement_ui_3/widgets/bottom_navigation_travelkuy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //setting Appbar
        appBar: AppBar(
          backgroundColor: mBackgroundColor,
          title: SvgPicture.asset('assets/svg/travelkuy_logo.svg'),
          elevation: 0 ,//for delete shadow
        ),
      backgroundColor: mBackgroundColor,
      bottomNavigationBar: BottomNavigationTravelkuy(),
    );
  }
}
