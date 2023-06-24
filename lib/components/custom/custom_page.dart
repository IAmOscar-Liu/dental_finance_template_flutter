import 'package:flutter/material.dart';
import 'package:namer_app/components/custom/custom_app_bar_title.dart';
import 'package:namer_app/components/custom/custom_sidebar.dart';

double sidebarWidth = 250;
double minScreenWidth = 1050;

class CustomPage extends StatelessWidget {
  const CustomPage({super.key, required this.page});

  final Widget page;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        toolbarHeight: 66,
        title: CustomAppBarTitle(sidebarWidth: sidebarWidth,),
      ),
      body: Row(
        children: [
          CustomSidebar(sidebarWidth: sidebarWidth,),
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
