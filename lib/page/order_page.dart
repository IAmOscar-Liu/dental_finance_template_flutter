import 'package:flutter/material.dart';
import 'package:namer_app/components/custom_dropdown_menu.dart';

enum DentalStatus {
  contact,
  underContact,
  terminated,
}

class OrderPage extends StatefulWidget {
  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  DentalStatus? _dentalStatus = DentalStatus.underContact;

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
                      EdgeInsets.only(left: 24, top: 24, right: 24, bottom: 36),
                  child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 1000),
                      child: Column(
                        children: [
                          Container(
                            color: Colors.white,
                            child: Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                              child: Row(
                                children: [
                                  Icon(Icons.arrow_back_ios),
                                  Text("新增合約")
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(children: [
                            Spacer(flex: 1),
                            Expanded(
                              flex: 5,
                              child: Row(
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 25,
                                          height: 25,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 2, color: Colors.black),
                                              borderRadius:
                                                  BorderRadius.circular(1000)),
                                          child: Center(
                                            child: Text(
                                              "1",
                                              style: TextStyle(color: Colors.black),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 4),
                                          child: Text(
                                            "合約基本資料設定",
                                            style: TextStyle(color: Colors.black),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                    height: 2,
                                    color: Colors.grey,
                                  )),
                                  TextButton(
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 25,
                                          height: 25,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 2, color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(1000)),
                                          child: Center(
                                            child: Text(
                                              "2",
                                              style: TextStyle(color: Colors.grey),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 4),
                                          child: Text(
                                            "合約進階功能設定",
                                            style: TextStyle(color: Colors.grey),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                    height: 2,
                                    color: Colors.grey,
                                  )),
                                  TextButton(
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 25,
                                          height: 25,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 2, color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(1000)),
                                          child: Center(
                                            child: Text(
                                              "3",
                                              style: TextStyle(color: Colors.grey),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 4),
                                          child: Text(
                                            "合約內容確認",
                                            style: TextStyle(color: Colors.grey),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(
                              flex: 1,
                            ),
                            FilledButton(onPressed: () {}, child: Text("刪除訂單"))
                          ]),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            color: Colors.white,
                            child: Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                          onPressed: () {}, child: Text("合約類別")),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      TextButton(
                                          onPressed: () {}, child: Text("新建")),
                                    ],
                                  ),
                                  Form(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Table(
                                            defaultVerticalAlignment:
                                                TableCellVerticalAlignment.middle,
                                            columnWidths: {
                                              0: FlexColumnWidth(
                                                  0.2), // Width of label column
                                              1: FlexColumnWidth(
                                                  0.5), // Width of text field column
                                              2: FlexColumnWidth(0.25)
                                            },
                                            children: [
                                              TableRow(children: [
                                                TableCell(
                                                    child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text("牙技所名稱"),
                                                )),
                                                TableCell(
                                                    child: Row(
                                                  children: [
                                                    Text(
                                                      "福家牙技所",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {},
                                                      child: Text(
                                                        "我想重新選擇牙技所",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.blue),
                                                      ),
                                                    )
                                                  ],
                                                )),
                                                TableCell(child: Container())
                                              ]),
                                              TableRow(children: [
                                                TableCell(
                                                    child: Padding(
                                                  padding: EdgeInsets.all(8),
                                                  child: Text("牙技所自訂編號"),
                                                )),
                                                TableCell(
                                                    child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 8),
                                                  height: 32,
                                                  child: TextFormField(
                                                    decoration: InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                left: 10),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                        width: 2,
                                                                        color: Colors
                                                                            .grey))),
                                                  ),
                                                )),
                                                TableCell(child: Container())
                                              ]),
                                              TableRow(children: [
                                                TableCell(
                                                    child: Padding(
                                                  padding: EdgeInsets.all(8),
                                                  child: Text("牙技所聯絡人"),
                                                )),
                                                TableCell(
                                                    child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 8),
                                                  height: 32,
                                                  child: TextFormField(
                                                    decoration: InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                left: 10),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                        width: 2,
                                                                        color: Colors
                                                                            .grey))),
                                                  ),
                                                )),
                                                TableCell(
                                                    child: Center(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.symmetric(
                                                            horizontal: 6),
                                                    child: FilledButton(
                                                        onPressed: () {},
                                                        child: Text(
                                                          "檢視相關合約",
                                                          style: TextStyle(
                                                              fontSize: 12),
                                                        )),
                                                  ),
                                                ))
                                              ]),
                                              TableRow(children: [
                                                TableCell(
                                                    child: Padding(
                                                  padding: EdgeInsets.all(8),
                                                  child: Text("牙技所聯絡電話"),
                                                )),
                                                TableCell(
                                                    child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 8),
                                                  height: 32,
                                                  child: TextFormField(
                                                    keyboardType:
                                                        TextInputType.phone,
                                                    decoration: InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                left: 10),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                        width: 2,
                                                                        color: Colors
                                                                            .grey))),
                                                  ),
                                                )),
                                                TableCell(child: Container())
                                              ]),
                                              TableRow(children: [
                                                TableCell(
                                                    child: Padding(
                                                  padding: EdgeInsets.all(8),
                                                  child: Text("牙技所郵件地址"),
                                                )),
                                                TableCell(
                                                    child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 8),
                                                  height: 32,
                                                  child: TextFormField(
                                                    keyboardType:
                                                        TextInputType.emailAddress,
                                                    decoration: InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                left: 10),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                        width: 2,
                                                                        color: Colors
                                                                            .grey))),
                                                  ),
                                                )),
                                                TableCell(child: Container())
                                              ]),
                                              TableRow(children: [
                                                TableCell(
                                                    child: Padding(
                                                  padding: EdgeInsets.all(8),
                                                  child: Text("牙技所地址"),
                                                )),
                                                TableCell(
                                                    child: Container(
                                                        margin:
                                                            EdgeInsets.symmetric(
                                                                vertical: 8),
                                                        child: Wrap(
                                                          runSpacing: 6,
                                                          children: [
                                                            CustomDropdownMenu(
                                                                labelname: '縣市',
                                                                menuSelections: [
                                                                  "台北市",
                                                                  "新北市",
                                                                  "新竹市"
                                                                ],
                                                                onSelect:
                                                                    (String value) {
                                                                  print(
                                                                      "You select $value");
                                                                }),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            CustomDropdownMenu(
                                                                labelname: '鄉鎮市區',
                                                                menuSelections: [
                                                                  "中正區",
                                                                  "中山區",
                                                                  "大安區",
                                                                  "信義區",
                                                                ],
                                                                onSelect:
                                                                    (String value) {
                                                                  print(
                                                                      "You select $value");
                                                                })
                                                          ],
                                                        ))),
                                                TableCell(child: Container()),
                                              ]),
                                              TableRow(children: [
                                                TableCell(child: Container()),
                                                TableCell(
                                                    child: Container(
                                                  height: 75,
                                                  margin: EdgeInsets.only(
                                                      top: 6, bottom: 6),
                                                  child: TextFormField(
                                                    keyboardType:
                                                        TextInputType.multiline,
                                                    maxLines: null,
                                                    expands: true,
                                                    decoration: InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                left: 10),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                        width: 2,
                                                                        color: Colors
                                                                            .grey))),
                                                  ),
                                                )),
                                                TableCell(child: Container()),
                                              ])
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Expanded(
                                            flex: 2,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 32.0),
                                              child: Table(
                                                columnWidths: {
                                                  0: FlexColumnWidth(
                                                      0.3), // Width of label column
                                                  1: FlexColumnWidth(
                                                      0.5), // Width of text field column
                                                },
                                                children: [
                                                  TableRow(children: [
                                                    TableCell(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Text("牙技所狀態"),
                                                      ),
                                                    ),
                                                    TableCell(
                                                        child: Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: 0),
                                                      child: Wrap(
                                                        spacing: 12,
                                                        runSpacing: 6,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize.min,
                                                            children: [
                                                              Radio(
                                                                  value:
                                                                      DentalStatus
                                                                          .contact,
                                                                  groupValue:
                                                                      _dentalStatus,
                                                                  onChanged:
                                                                      (DentalStatus?
                                                                          value) {
                                                                    setState(() {
                                                                      _dentalStatus =
                                                                          value;
                                                                    });
                                                                  }),
                                                              Text("聯繫中"),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize.min,
                                                            children: [
                                                              Radio(
                                                                  value: DentalStatus
                                                                      .underContact,
                                                                  groupValue:
                                                                      _dentalStatus,
                                                                  onChanged:
                                                                      (DentalStatus?
                                                                          value) {
                                                                    setState(() {
                                                                      _dentalStatus =
                                                                          value;
                                                                    });
                                                                  }),
                                                              Text("合約中"),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize.min,
                                                            children: [
                                                              Radio(
                                                                  value: DentalStatus
                                                                      .terminated,
                                                                  groupValue:
                                                                      _dentalStatus,
                                                                  onChanged:
                                                                      (DentalStatus?
                                                                          value) {
                                                                    setState(() {
                                                                      _dentalStatus =
                                                                          value;
                                                                    });
                                                                  }),
                                                              Text("已解約"),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ))
                                                  ]),
                                                  TableRow(children: [
                                                    TableCell(
                                                        child: Padding(
                                                      padding: EdgeInsets.all(8),
                                                      child: Text("牙技所統一編號"),
                                                    )),
                                                    TableCell(
                                                        child: Container(
                                                      height: 32,
                                                      margin: EdgeInsets.symmetric(
                                                          vertical: 6),
                                                      child: TextFormField(
                                                        decoration: InputDecoration(
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    left: 10),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                                    borderSide: BorderSide(
                                                                        width: 2,
                                                                        color: Colors
                                                                            .grey))),
                                                      ),
                                                    )),
                                                  ]),
                                                  TableRow(children: [
                                                    TableCell(
                                                        child: Padding(
                                                      padding: EdgeInsets.all(8),
                                                      child: Text("備註"),
                                                    )),
                                                    TableCell(
                                                        child: Container(
                                                      height: 150,
                                                      margin: EdgeInsets.symmetric(
                                                          vertical: 6),
                                                      child: TextFormField(
                                                        keyboardType:
                                                            TextInputType.multiline,
                                                        maxLines: null,
                                                        expands: true,
                                                        decoration: InputDecoration(
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    left: 10),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                                    borderSide: BorderSide(
                                                                        width: 2,
                                                                        color: Colors
                                                                            .grey))),
                                                      ),
                                                    ))
                                                  ])
                                                ],
                                              ),
                                            ))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ))),
            ),
          ),
        ),
      ],
    );
  }
}
