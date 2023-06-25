import 'package:flutter/material.dart';
import 'package:namer_app/components/custom/custom_dropdown_menu.dart';
import 'package:namer_app/components/custom/custom_page_title.dart';
import 'package:namer_app/components/custom/custom_table_group.dart';
import 'package:namer_app/types.dart';

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

    return SizedBox.expand(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 24, top: 16, right: 24, bottom: 36),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 1000),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomPageTitle(
                      pageTitle: "財務報表", pageTitleIconData: Icons.summarize),
                  SizedBox(
                    height: 12,
                  ),
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
                        menuSelections: ["台北牙技所", "新竹牙技所", "台中牙技所", "高雄牙技所"],
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
                    children: [
                      CustomTableGroup(
                        tableData: TableData(
                          tableTitle: "幣別: TWD",
                          rowData: [
                            TableRowData(
                                isHeaderOrFooter: true,
                                rowData: ["訂單編號", "交易金額"]),
                            TableRowData(
                                isHeaderOrFooter: false,
                                rowData: ["S202301010001", "10,000"]),
                            TableRowData(
                                isHeaderOrFooter: false,
                                rowData: ["S202301010002", "20,000"]),
                            TableRowData(
                                isHeaderOrFooter: true,
                                rowData: ["小計", "30,000"]),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      CustomTableGroup(
                          tableData: TableData(
                        tableTitle: "幣別: USD",
                        rowData: [
                          TableRowData(
                              isHeaderOrFooter: true,
                              rowData: ["訂單編號", "交易金額"]),
                          TableRowData(
                              isHeaderOrFooter: false,
                              rowData: ["S202301010003", "1,000"]),
                          TableRowData(
                              isHeaderOrFooter: true, rowData: ["小計", "1,000"]),
                        ],
                      )),
                      SizedBox(
                        height: 12,
                      ),
                      CustomTableGroup(
                        tableData: TableData(tableTitle: "交易金額換算", rowData: [
                          TableRowData(isHeaderOrFooter: true, rowData: [
                            "交易幣別",
                            "交易金額",
                            "預設匯率(TWD)",
                            "換算金額(TWD)"
                          ]),
                          TableRowData(
                              isHeaderOrFooter: false,
                              rowData: ["TWD", "30,000", "1", "30,000"]),
                          TableRowData(
                              isHeaderOrFooter: false,
                              rowData: ["USD", "1,000", "30", "30,000"]),
                        ]),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      CustomTableGroup(
                          tableData:
                              TableData(tableTitle: "服務費(TWD)", rowData: [
                        TableRowData(
                            isHeaderOrFooter: false,
                            rowData: ["基本費", "25,000"]),
                        TableRowData(
                            isHeaderOrFooter: false,
                            rowData: ["交易金額", "60,000"]),
                        TableRowData(
                            isHeaderOrFooter: false,
                            rowData: ["免費額度", "50,000"]),
                        TableRowData(
                            isHeaderOrFooter: false,
                            rowData: ["交易金額", "60,000"]),
                        TableRowData(
                            isHeaderOrFooter: false,
                            rowData: ["超額金額", "10,000"]),
                        TableRowData(
                            isHeaderOrFooter: false,
                            rowData: ["超額服務費(10%)", "1,000"]),
                        TableRowData(
                            isHeaderOrFooter: true, rowData: ["總計", "26,000"]),
                      ])),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
