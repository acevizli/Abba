import 'package:flutter/material.dart';
import 'package:flutter_appp/constants.dart';
import 'package:flutter_appp/navigations/BottomNavbarItem.dart';

class BottomNavBar extends StatelessWidget {
  @override
  final Map<BottomNavbarItem,IconData> items;
  final BottomNavbarItem selected;
  final Function(int) onTap;

  const BottomNavBar({Key key, this.items, this.selected, this.onTap}) : super(key: key);
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: kPrimaryColor,
      unselectedItemColor: kPrimaryLightColor,
      currentIndex: BottomNavbarItem.values.indexOf(selected),
      onTap: onTap,
      items: items
          .map((item, icon) => MapEntry(
        item.toString(),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(icon, size: 30.0),
        ),
      ))
          .values
          .toList(),
    );
  }
}