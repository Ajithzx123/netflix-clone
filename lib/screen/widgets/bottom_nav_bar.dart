import 'package:flutter/material.dart';
import 'package:netflix/Constants/Colors/Colors.dart';

ValueNotifier<int> indexnotifier = ValueNotifier(0);

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexnotifier,
      builder: (context, int newIndex, _) {
        return BottomNavigationBar(
          currentIndex: newIndex,
          onTap: (index) {
            indexnotifier.value = index;
          },
          backgroundColor: backgroundBlack,
          selectedItemColor: backgroundWhite,
          unselectedItemColor: backgroundGrey,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(
            fontSize: 11,
          ),
          unselectedFontSize: 10,
          selectedIconTheme: const IconThemeData(
            color: backgroundWhite,
          ),
          unselectedIconTheme: const IconThemeData(
            color: backgroundGrey,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_collection_outlined),
              activeIcon: Icon(Icons.video_collection),
              label: 'New and Hot',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.emoji_emotions_outlined),
              activeIcon: Icon(Icons.emoji_emotions),
              label: 'Fast Laughs',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.download_for_offline_outlined),
              activeIcon: Icon(Icons.download_for_offline_rounded),
              label: 'Downloads',
            ),
          ],
        );
      },
    );
  }
}
