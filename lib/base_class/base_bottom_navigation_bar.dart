import 'package:book_store/app_export.dart';

class BottomBar {
  static BottomNavigationBar bottomNavigationBar({required int index, required onBottomTap}) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: onBottomTap,
      elevation: 5,
      backgroundColor: BookStoreColor.white,
      unselectedItemColor: BookStoreColor.grey,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: BookStoreColor.primaryColor,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
          activeIcon: Icon(IconPath.home),
          icon: Icon(IconPath.outLineHome),
          label: "Home",
          tooltip: "Home",
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(IconPath.fav),
          icon: Icon(IconPath.outLineFav),
          label: "Like",
          tooltip: "Like",
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(IconPath.cart),
          icon: Icon(IconPath.outLineCart),
          label: "Cart",
          tooltip: "Cart",
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(IconPath.user),
          icon: Icon(IconPath.outLineUser),
          label: "User",
          tooltip: "User",
        ),
      ],
    );
  }
}