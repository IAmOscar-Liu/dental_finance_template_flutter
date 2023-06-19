import 'package:flutter/material.dart';

class Item {
  const Item({required this.icon, required this.content});

  final Widget icon;
  final String content;
}

class Sidebar extends StatelessWidget {
  Sidebar(
      {super.key,
      required this.onDestinationSelected,
      required this.selectedIndex});

  final Function onDestinationSelected;
  final int selectedIndex;

  final List<Item> navigationRailDestinations = [
    Item(icon: Icon(Icons.home), content: "Home"),
    Item(icon: Icon(Icons.favorite), content: 'Favorites'),
    Item(icon: Icon(Icons.attach_money), content: 'Finance')
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: 250,
        child: NavigationRail(
          extended: true,
          destinations: navigationRailDestinations
              .map((item) => NavigationRailDestination(
                  icon: item.icon,
                  label: Text(item.content, style: TextStyle(fontSize: 20))))
              .toList(),
          selectedIndex: selectedIndex,
          onDestinationSelected: (value) {
            onDestinationSelected(value);
          },
        ),
      ),
    );
  }
}
