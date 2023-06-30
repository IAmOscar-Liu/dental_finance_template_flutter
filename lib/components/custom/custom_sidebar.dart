import 'package:flutter/material.dart';

class Item {
  const Item({
    required this.iconData,
    required this.title,
    required this.pathname,
    required this.hasChildren,
  });

  final IconData iconData;
  final String title;
  final String pathname;
  final bool hasChildren;
}

final List<Item> navigationDestinations = [
  Item(iconData: Icons.home, title: "Home", pathname: "/", hasChildren: false),
  Item(
    iconData: Icons.favorite,
    title: 'Favorites',
    pathname: "/favorites",
    hasChildren: false,
  ),
  Item(
    iconData: Icons.dvr,
    title: '牙技所管理',
    pathname: "/dental-management",
    hasChildren: true,
  ),
  Item(
    iconData: Icons.add,
    title: '新增牙技所',
    pathname: "/dental-management/new",
    hasChildren: false,
  ),
  Item(
    iconData: Icons.dvr,
    title: '合約管理',
    pathname: "/contract-management",
    hasChildren: true,
  ),
  Item(
    iconData: Icons.add,
    title: '新增合約',
    pathname: "/contract-management/new",
    hasChildren: false,
  ),
  Item(
      iconData: Icons.summarize,
      title: '財務報表',
      pathname: "/finance",
      hasChildren: false),
];

class CustomSidebar extends StatelessWidget {
  CustomSidebar({super.key, required this.sidebarWidth});

  final double sidebarWidth;

  bool isTopPath(String pathname) {
    return pathname.split("/").where((e) => e.isNotEmpty).length <= 1;
  }

  @override
  Widget build(BuildContext context) {
    String? currentPathname = ModalRoute.of(context)?.settings.name;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      width: sidebarWidth,
      child: ListView(
        padding: EdgeInsets.zero,
        children: navigationDestinations
            .map((item) => Padding(
                  padding:
                      EdgeInsets.only(top: isTopPath(item.pathname) ? 8 : 0),
                  child: ListTile(
                    tileColor: currentPathname == item.pathname
                        ? Color.fromRGBO(251, 199, 184, 1)
                        : Colors.transparent,
                    leading: isTopPath(item.pathname)
                        ? Icon(item.iconData)
                        : Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Icon(item.iconData),
                          ),
                    trailing: item.hasChildren
                        ? Icon(
                            Icons.more_vert,
                            size: 16,
                          )
                        : null,
                    title: Text(item.title, style: TextStyle(fontSize: 18)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    dense: true,
                    onTap: () {
                      Navigator.pushNamed(context, item.pathname);
                    },
                  ),
                ))
            .toList(),
      ),
    );
  }
}
