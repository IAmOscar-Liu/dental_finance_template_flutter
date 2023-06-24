import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({required this.sidebarWidth})
      : super(
            titleSpacing: 0,
            centerTitle: false,
            automaticallyImplyLeading: false,
            toolbarHeight: 66,
            title: Row(
              children: [
                Container(
                    width: sidebarWidth,
                    height: 66,
                    color: Color.fromRGBO(245, 222, 216, 1),
                    child: Center(
                      child: Transform.translate(
                        offset: Offset(-10, 5),
                        child: SvgPicture.asset(
                          "assets/images/logo.ab283875.svg",
                          fit: BoxFit.cover,
                          width: 172,
                          height: 40,
                          colorFilter:
                              ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                        ),
                      ),
                    )),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Text("牙技財務暨設備管理平台",
                            style: TextStyle(
                                color: Color.fromRGBO(93, 88, 87, 1),
                                letterSpacing: 2,
                                fontSize: 24,
                                fontWeight: FontWeight.bold)),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {},
                                iconSize: 24,
                                icon: Icon(
                                  Icons.language,
                                  // size: 24,
                                  color: Color.fromRGBO(93, 88, 87, 1),
                                ),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              IconButton(
                                onPressed: () {},
                                iconSize: 24,
                                icon: Icon(
                                  Icons.notifications,
                                  // size: 24,
                                  color: Color.fromRGBO(93, 88, 87, 1),
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              SizedBox(
                                width: 180,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          border: Border.all(width: 1),
                                          borderRadius:
                                              BorderRadius.circular(100000)),
                                      child: FlutterLogo(size: 30),
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "牙技平台管理人",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color:
                                                Color.fromRGBO(93, 88, 87, 1),
                                          ),
                                        ),
                                        Text("王小明",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color:
                                                  Color.fromRGBO(93, 88, 87, 1),
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              IconButton(
                                onPressed: () {},
                                iconSize: 24,
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  // size: 24,
                                  color: Color.fromRGBO(93, 88, 87, 1),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ));

  final double sidebarWidth;
}
