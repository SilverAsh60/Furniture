import 'package:final_project_funiture_app/screens/cart.dart';
import 'package:final_project_funiture_app/screens/collection.dart';
import 'package:final_project_funiture_app/screens/favorite.dart';
import 'package:final_project_funiture_app/screens/home.dart';
import 'package:final_project_funiture_app/screens/notification.dart';
import 'package:final_project_funiture_app/screens/profilescreen.dart';
import 'package:flutter/material.dart';

var bottomNavigationBarItems = <BottomNavigationBarItem>[
  const BottomNavigationBarItem(
    backgroundColor: Color(0x00ffffff),
    activeIcon: Icon(
      Icons.home_outlined,
      color: Color(0xff80221e),
    ),
    icon: Icon(
      Icons.home_outlined,
      color: Colors.black,
    ),
    label: "Home",
  ),
  const BottomNavigationBarItem(
    backgroundColor: Color(0x00ffffff),
    icon: Icon(Icons.grid_view_outlined, color: Colors.black),
    activeIcon: Icon(
      Icons.grid_view_outlined,
      color: Color(0xff80221e),
    ),
    label: "Collection",
  ),
  const BottomNavigationBarItem(
    backgroundColor: Color(0x00ffffff),
    icon: Icon(Icons.shopping_bag_outlined, color: Colors.black),
    activeIcon: Icon(
      Icons.shopping_bag_outlined,
      color: Color(0xff80221e),
    ),
    label: "Cart",
  ),
  const BottomNavigationBarItem(
    backgroundColor: Color(0x00ffffff),
    activeIcon: Icon(
      Icons.notifications_active_outlined,
      color: Color(0xff80221e),
    ),
    icon: Icon(Icons.notifications_active_outlined, color: Colors.black),
    label: "Notification",
  ),
  const BottomNavigationBarItem(
    backgroundColor: Color(0x00ffffff),
    icon: Icon(Icons.favorite_border_outlined, color: Colors.black),
    activeIcon: Icon(
      Icons.favorite_border_outlined,
      color: Color(0xff80221e),
    ),
    label: "Favorite",
  ),
  const BottomNavigationBarItem(
    backgroundColor: Color(0x00ffffff),
    icon: Icon(Icons.account_circle_rounded, color: Colors.black),
    activeIcon: Icon(
      Icons.favorite_border_outlined,
      color: Color(0xff80221e),
    ),
    label: "Profile",
  ),
];

Widget getFooter(int selectedItem, BuildContext context) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: const Color(0xff80221e),
    selectedFontSize: 20,
    elevation: 0.0,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    currentIndex: selectedItem,
    selectedIconTheme: const IconThemeData(
      color: Color(0xff80221e),
    ),
    backgroundColor: const Color(0x00ffffff),
    items: bottomNavigationBarItems,
    onTap: (selectedItem) => itemClick(selectedItem, context),
  );
}

void itemClick(int selectedItem, BuildContext context) {
  if (selectedItem == 0) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  } else if (selectedItem == 1) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const CollectionPage()));
  } else if (selectedItem == 2) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const CartPage()));
  } else if (selectedItem == 3) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const NotificationPage()));
  } else if (selectedItem == 4) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const FavoritePage()));
  } else if (selectedItem == 5) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProfileScreen()));
  }
}
