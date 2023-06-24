import 'package:flutter/material.dart';
import 'package:namer_app/components/custom/custom_app_bar.dart';
import 'package:namer_app/components/custom/custom_sidebar.dart';

class CustomPage extends StatelessWidget {
  const CustomPage(
      {super.key,
      this.sidebarWidth = 250,
      this.minScreenWidth = 1050,
      required this.page});

  final double sidebarWidth;
  final double minScreenWidth;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(sidebarWidth: sidebarWidth),
      body: Row(
        children: [
          CustomSidebar(
            sidebarWidth: sidebarWidth,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                width: screenWidth - sidebarWidth,
                constraints: BoxConstraints(
                  minWidth: minScreenWidth - sidebarWidth,
                ),
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
