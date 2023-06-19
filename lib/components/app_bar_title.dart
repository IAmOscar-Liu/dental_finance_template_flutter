import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 250,
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
                  colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                ),
              ),
            )),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text("牙技財務暨設備管理平台",
                style: TextStyle(
                    color: Color.fromRGBO(93, 88, 87, 1),
                    letterSpacing: 2,
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.language,
                size: 24,
                color: Color.fromRGBO(93, 88, 87, 1),
              ),
              SizedBox(
                width: 12,
              ),
              Icon(
                Icons.notifications,
                size: 24,
                color: Color.fromRGBO(93, 88, 87, 1),
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "牙技平台管理人-0001145e-e41d-433a-be1e-a9b5496c1cb4",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(93, 88, 87, 1),
                    ),
                  ),
                  Text("user_account_title_mr",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(93, 88, 87, 1),
                      )),
                ],
              ),
              SizedBox(
                width: 12,
              ),
              Icon(
                Icons.keyboard_arrow_down,
                size: 36,
                color: Color.fromRGBO(93, 88, 87, 1),
              )
            ],
          ),
        )
      ],
    );
  }
}
