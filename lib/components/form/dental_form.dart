import 'package:flutter/material.dart';
import 'package:namer_app/components/custom_dropdown_menu.dart';
import 'package:namer_app/district.dart';
import 'package:namer_app/my_app_state.dart';
import 'package:provider/provider.dart';

class DentalForm extends StatelessWidget {
  const DentalForm({super.key});

  @override
  Widget build(BuildContext context) {
    MyAppState appState = context.watch<MyAppState>();
    String? dentalStatus = appState.dentalForm["牙技所狀態"];

    return Form(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: {
                0: FlexColumnWidth(0.2), // Width of label column
                1: FlexColumnWidth(0.5), // Width of text field column
              },
              children: [
                TableRow(children: [
                  Text("牙技所名稱"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "福家牙技所",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "我想重新選擇牙技所",
                            style: TextStyle(fontSize: 12, color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
                TableRow(children: [
                  Text("牙技所ID"),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("0000-0000-0000-0001"),
                  ),
                ]),
                TableRow(children: [
                  Text("牙技所統一編號"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 32,
                      child: TextFormField(
                        initialValue: appState.dentalForm["牙技所統一編號"],
                        onChanged: (value) {
                          appState.setDentalForm(key: "牙技所統一編號", value: value);
                        },
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2, color: Colors.grey))),
                      ),
                    ),
                  ),
                ]),
                TableRow(children: [
                  Text("牙技所聯絡人"),
                  // Text("1235")
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 32,
                            child: TextFormField(
                              initialValue: appState.dentalForm["牙技所聯絡人"],
                              onChanged: (value) {
                                appState.setDentalForm(
                                    key: "牙技所聯絡人", value: value);
                              },
                              decoration: InputDecoration(
                                  hintText: "e.g. 王小明",
                                  contentPadding: EdgeInsets.only(left: 10),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2, color: Colors.grey))),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        FilledButton(
                            onPressed: () {},
                            child: Text(
                              "檢視相關合約",
                              style: TextStyle(fontSize: 12),
                            )),
                      ],
                    ),
                  ),
                ]),
                TableRow(children: [
                  Text("牙技所電話"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 32,
                      child: TextFormField(
                        initialValue: appState.dentalForm["牙技所電話"],
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            hintText: "e.g. 02-2222-2222",
                            contentPadding: EdgeInsets.only(left: 10),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2, color: Colors.grey))),
                      ),
                    ),
                  ),
                ]),
                TableRow(children: [
                  Text("牙技所Email"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 32,
                      child: TextFormField(
                        initialValue: appState.dentalForm["牙技所Email"],
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: "example@example.com",
                            contentPadding: EdgeInsets.only(left: 10),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2, color: Colors.grey))),
                      ),
                    ),
                  ),
                ]),
                TableRow(children: [
                  Text("牙技所地址"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      runSpacing: 6,
                      children: [
                        CustomDropdownMenu(
                            key: UniqueKey(),
                            labelname: '縣市',
                            initialSelection: appState.dentalForm["牙技所縣市"],
                            menuSelections: citiesTW,
                            onSelect: (String? value) {
                              // print("You select $value");
                              appState.setDentalForm(
                                  key: "牙技所縣市", value: value ?? "請選擇");
                              appState.setDentalForm(
                                  key: "牙技所鄉鎮市區", value: "請選擇");
                            }),
                        SizedBox(
                          width: 10,
                        ),
                        CustomDropdownMenu(
                            key: UniqueKey(),
                            labelname: '鄉鎮市區',
                            initialSelection: appState.dentalForm["牙技所鄉鎮市區"],
                            menuSelections:
                                districtTW[appState.dentalForm["牙技所縣市"]] ??
                                    ["請選擇"],
                            onSelect: (String? value) {
                              // print("You select $value");
                              appState.setDentalForm(
                                  key: "牙技所鄉鎮市區", value: value ?? "請選擇");
                            })
                      ],
                    ),
                  ),
                ]),
                TableRow(children: [
                  Container(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 75,
                      child: TextFormField(
                        initialValue: appState.dentalForm["牙技所地址"],
                        onChanged: (value) {
                          appState.setDentalForm(key: "牙技所地址", value: value);
                        },
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        expands: true,
                        decoration: InputDecoration(
                            hintText: "e.g. 工業東三路1號5樓",
                            contentPadding: EdgeInsets.only(left: 10),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2, color: Colors.grey))),
                      ),
                    ),
                  ),
                ])
              ],
            ),
          ),
          SizedBox(
            width: 24,
          ),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  columnWidths: {
                    0: FlexColumnWidth(0.2), // Width of label column
                    1: FlexColumnWidth(0.5), // Width of text field column
                  },
                  children: [
                    TableRow(children: [
                      Text("牙技所狀態"),
                      Wrap(
                        spacing: 12,
                        runSpacing: 6,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Radio(
                                  value: "contact",
                                  groupValue: dentalStatus,
                                  onChanged: (String? value) {
                                    appState.setDentalForm(
                                        key: "牙技所狀態",
                                        value: value ?? "contact");
                                  }),
                              Text("聯繫中"),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Radio(
                                  value: "underContract",
                                  groupValue: dentalStatus,
                                  onChanged: (String? value) {
                                    appState.setDentalForm(
                                        key: "牙技所狀態",
                                        value: value ?? "contact");
                                  }),
                              Text("合約中"),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Radio(
                                  value: "terminated",
                                  groupValue: dentalStatus,
                                  onChanged: (String? value) {
                                    appState.setDentalForm(
                                        key: "牙技所狀態",
                                        value: value ?? "contact");
                                  }),
                              Text("已解約"),
                            ],
                          )
                        ],
                      )
                    ]),
                    TableRow(children: [
                      Text("牙技所合約類別"),
                      Padding(
                          padding: EdgeInsets.all(8),
                          child: CustomDropdownMenu(
                            initialSelection: appState.contractForm["合約種類"],
                            labelname: "合約類別",
                            menuSelections: ["服務平台合約", "設備租賃合約", "設備買斷合約"],
                            onSelect: (String? value) {
                              appState.setContractForm(
                                  key: "合約種類", value: value ?? "請選擇");
                            },
                          )),
                    ]),
                    TableRow(children: [
                      TableCell(
                          verticalAlignment: TableCellVerticalAlignment.top,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text("備註"),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 150,
                          child: TextFormField(
                            initialValue: appState.dentalForm["備註"],
                            onChanged: (value) {
                              appState.setDentalForm(key: "備註", value: value);
                            },
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            expands: true,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.grey))),
                          ),
                        ),
                      )
                    ])
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
