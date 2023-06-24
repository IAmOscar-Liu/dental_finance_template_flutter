import 'package:flutter/material.dart';

class CustomPageTitle extends StatelessWidget {
  const CustomPageTitle(
      {super.key,
      required this.pageTitle,
      required this.pageTitleIconData,
      this.tailling});

  final String pageTitle;
  final IconData pageTitleIconData;
  final Widget? tailling;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 24, vertical: tailling != null ? 4 : 8),
        child: Row(
          children: [
            Icon(pageTitleIconData),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                pageTitle,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Spacer(),
            tailling ?? Spacer(),
          ],
        ),
      ),
    );
  }
}
