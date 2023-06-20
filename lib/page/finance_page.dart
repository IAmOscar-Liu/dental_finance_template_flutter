import 'package:flutter/material.dart';
import 'package:namer_app/components/custom_dropdown_menu.dart';

class FinancePage extends StatefulWidget {
  @override
  State<FinancePage> createState() => _FinancePageState();
}

class _FinancePageState extends State<FinancePage> {
  String? reportType;
  String? dentalRegion;

  @override
  Widget build(BuildContext context) {
    // MyAppState appState = context.watch<MyAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding:
                    EdgeInsets.only(left: 24, top: 16, right: 24, bottom: 36),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 1000),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "${dentalRegion ?? "XX牙技所"}${reportType ?? "XX結算報表"} 2023/01/05 ~ 2023/02/04",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(69, 56, 52, 1)),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Spacer(),
                          CustomDropdownMenu(
                            labelname: "選擇牙技所",
                            menuSelections: [
                              "台北牙技所",
                              "新竹牙技所",
                              "台中牙技所",
                              "高雄牙技所"
                            ],
                            onSelect: (String value) {
                              print("You select $value");
                              setState(() {
                                dentalRegion = value;
                              });
                            },
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          CustomDropdownMenu(
                            labelname: "選擇報表",
                            menuSelections: ["服務費結算表", "區域平台服務費總算表", "平台服務費總表"],
                            onSelect: (String value) {
                              print("You select $value");
                              setState(() {
                                reportType = value;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "幣別: TWD",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Table(
                            border:
                                TableBorder.all(width: 1, color: Colors.grey),
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.middle,
                            children: [
                              TableRow(children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 6),
                                  color: Color.fromRGBO(237, 76, 33, 1),
                                  child: Text(
                                    "訂單編號",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 6),
                                  color: Color.fromRGBO(237, 76, 33, 1),
                                  child: Text("交易金額",
                                      style: TextStyle(color: Colors.white)),
                                )
                              ]),
                              TableRow(children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 6),
                                  child: Text("S202301010001"),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 6),
                                  child: Text("10,000"),
                                )
                              ]),
                              TableRow(children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 6),
                                  color: Color.fromRGBO(247, 139, 110, 0.5),
                                  child: Text("S202301010002"),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 6),
                                  color: Color.fromRGBO(247, 139, 110, 0.5),
                                  child: Text("20,000"),
                                )
                              ]),
                              TableRow(children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 6),
                                  color: Color.fromRGBO(237, 76, 33, 1),
                                  child: Text(
                                    "小計",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 6),
                                  color: Color.fromRGBO(237, 76, 33, 1),
                                  child: Text(
                                    "30,000",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ])
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "幣別: USD",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Table(
                            border:
                                TableBorder.all(width: 1, color: Colors.grey),
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.middle,
                            children: [
                              TableRow(children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 6),
                                  color: Color.fromRGBO(237, 76, 33, 1),
                                  child: Text(
                                    "訂單編號",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 6),
                                  color: Color.fromRGBO(237, 76, 33, 1),
                                  child: Text("交易金額",
                                      style: TextStyle(color: Colors.white)),
                                )
                              ]),
                              TableRow(children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 6),
                                  child: Text("S202301010003"),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 6),
                                  child: Text("1,000"),
                                )
                              ]),
                              TableRow(children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 6),
                                  color: Color.fromRGBO(237, 76, 33, 1),
                                  child: Text(
                                    "小計",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 6),
                                  color: Color.fromRGBO(237, 76, 33, 1),
                                  child: Text(
                                    "1,000",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ])
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "交易金額換算",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Table(
                            border:
                                TableBorder.all(width: 1, color: Colors.grey),
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.middle,
                            children: [
                              TableRow(children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 6),
                                  color: Color.fromRGBO(237, 76, 33, 1),
                                  child: Text(
                                    "交易幣別",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 6),
                                  color: Color.fromRGBO(237, 76, 33, 1),
                                  child: Text("交易金額",
                                      style: TextStyle(color: Colors.white)),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 6),
                                  color: Color.fromRGBO(237, 76, 33, 1),
                                  child: Text("預設匯率(TWD)",
                                      style: TextStyle(color: Colors.white)),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 6),
                                  color: Color.fromRGBO(237, 76, 33, 1),
                                  child: Text("換算金額(TWD)",
                                      style: TextStyle(color: Colors.white)),
                                )
                              ]),
                              TableRow(children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 6),
                                  child: Text("TWD"),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 6),
                                  child: Text("30,000"),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 6),
                                  child: Text("1"),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 6),
                                  child: Text("30,000"),
                                )
                              ]),
                              TableRow(children: [
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 6, horizontal: 6),
                                    color: Color.fromRGBO(247, 139, 110, 0.5),
                                    child: Text("USD")),
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 6, horizontal: 6),
                                    color: Color.fromRGBO(247, 139, 110, 0.5),
                                    child: Text("1,000")),
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 6, horizontal: 6),
                                    color: Color.fromRGBO(247, 139, 110, 0.5),
                                    child: Text("30")),
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 6, horizontal: 6),
                                    color: Color.fromRGBO(247, 139, 110, 0.5),
                                    child: Text("30,000")),
                              ])
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "服務費(TWD)",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Table(
                            border:
                                TableBorder.all(width: 1, color: Colors.grey),
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.middle,
                            children: [
                              TableRow(children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 6),
                                  child: Text("基本費"),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 6),
                                  child: Text("25,000"),
                                ),
                              ]),
                              TableRow(children: [
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 6, horizontal: 6),
                                    color: Color.fromRGBO(247, 139, 110, 0.5),
                                    child: Text("免費額度")),
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 6, horizontal: 6),
                                    color: Color.fromRGBO(247, 139, 110, 0.5),
                                    child: Text("50,000")),
                              ]),
                              TableRow(children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 6),
                                  child: Text("交易金額"),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 6),
                                  child: Text("60,000"),
                                ),
                              ]),
                              TableRow(children: [
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 6, horizontal: 6),
                                    color: Color.fromRGBO(247, 139, 110, 0.5),
                                    child: Text("超額金額")),
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 6, horizontal: 6),
                                    color: Color.fromRGBO(247, 139, 110, 0.5),
                                    child: Text("10,000")),
                              ]),
                              TableRow(children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 6),
                                  child: Text("超額服務費(10%)"),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 6),
                                  child: Text("1,000"),
                                ),
                              ]),
                              TableRow(children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 6),
                                  color: Color.fromRGBO(237, 76, 33, 1),
                                  child: Text(
                                    "總計",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 6),
                                  color: Color.fromRGBO(237, 76, 33, 1),
                                  child: Text(
                                    "26,000",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ])
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
