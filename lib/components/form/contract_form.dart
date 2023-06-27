import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:namer_app/components/custom/custom_dropdown_menu.dart';
import 'package:namer_app/components/custom/custom_radio_group.dart';
import 'package:namer_app/components/custom/custom_text_form_field_date.dart';
import 'package:namer_app/my_app_state.dart';

class ContractForm extends StatelessWidget {
  const ContractForm({super.key, required this.formKey, required this.appState});

  final Key formKey;
  final MyAppState appState;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
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
                        Text(
                          "牙技所名稱",
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              appState.dentalForm["牙技所名稱"] ?? "",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      ]),
                      TableRow(children: [
                        Text(
                          "合約ID",
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(appState.contractForm["合約ID"] ?? "C-10001"),
                        ),
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
                        Text("合約收費方案"),
                        Padding(
                            padding: EdgeInsets.all(8),
                            child: CustomDropdownMenu(
                              initialSelection: appState.contractForm["合約收費方案"],
                              labelname: "合約收費方案",
                              menuSelections: [
                                "Early Bird - 綁約兩年，每月3800",
                                "Standard - 綁約兩年，小12700",
                                "Standard - 綁約兩年，中21700",
                                "Standard - 綁約兩年，大30700",
                              ],
                              width: 280,
                              onSelect: (String? value) {
                                appState.setContractForm(
                                    key: "合約收費方案", value: value ?? "請選擇");
                              },
                            )),
                      ]),
                      TableRow(children: [
                        Text(
                          "合約編號",
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 32,
                            child: TextFormField(
                              initialValue: appState.contractForm["合約編號"],
                              onChanged: (value) {
                                appState.setContractForm(
                                    key: "合約編號", value: value);
                              },
                              validator: (value) => (value ?? "").isEmpty
                                  ? "This field is required"
                                  : null,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 10),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2, color: Colors.grey))),
                            ),
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Text(
                          "合約名稱",
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 32,
                            child: TextFormField(
                              initialValue: appState.contractForm['合約名稱'],
                              onChanged: (value) {
                                appState.setContractForm(
                                    key: "合約名稱", value: value);
                              },
                              validator: (value) => (value ?? "").isEmpty
                                  ? "This field is required"
                                  : null,
                              decoration: InputDecoration(
                                  hintText: "e.g. XX牙技所服務平台合約",
                                  contentPadding: EdgeInsets.only(left: 10),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2, color: Colors.grey))),
                            ),
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Text(
                          "合約起始日",
                        ),
                        Row(
                          children: [
                            Container(
                                margin: EdgeInsets.all(8),
                                height: 32,
                                width: 180,
                                child: CustomTextFormFieldDate(
                                  key: UniqueKey(),
                                  initialDate: appState.contractForm["合約起始日"],
                                  onSelect: (String? value) {
                                    // print("You select date $value");
                                    appState.setContractForm(
                                        key: "合約起始日", value: value ?? "");
                                  },
                                )),
                          ],
                        ),
                      ]),
                      TableRow(children: [
                        Text(
                          "合約到期日",
                        ),
                        Row(
                          children: [
                            Container(
                                margin: EdgeInsets.all(8),
                                height: 32,
                                width: 180,
                                child: CustomTextFormFieldDate(
                                  key: UniqueKey(),
                                  initialDate: appState.contractForm["合約到期日"],
                                  onSelect: (String? value) {
                                    // print("You select date $value");
                                    appState.setContractForm(
                                        key: "合約到期日", value: value ?? "");
                                  },
                                )),
                          ],
                        ),
                      ]),
                      TableRow(children: [
                        Text(
                          "合約建立日",
                        ),
                        Row(
                          children: [
                            Container(
                                margin: EdgeInsets.all(8),
                                height: 32,
                                width: 180,
                                child: CustomTextFormFieldDate(
                                  key: UniqueKey(),
                                  initialDate: appState.contractForm["合約建立日"],
                                  onSelect: (String? value) {
                                    // print("You select date $value");
                                    appState.setContractForm(
                                        key: "合約建立日", value: value ?? "");
                                  },
                                )),
                          ],
                        ),
                      ]),
                    ],
                  )),
              SizedBox(
                width: 24,
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    columnWidths: {
                      0: FlexColumnWidth(0.2), // Width of label column
                      1: FlexColumnWidth(0.5), // Width of text field column
                    },
                    children: [
                      TableRow(children: [
                        Text("合約收費方式"),
                        CustomRadioGroup(
                            fallbackValue: "季繳",
                            groupOptions: ["月繳", "季繳", "年繳"],
                            groupValue: appState.contractForm["合約收費方式"] ?? "季繳",
                            onChange: (String value) {
                              appState.setContractForm(
                                  key: "合約收費方式", value: value);
                            })
                      ]),
                      TableRow(children: [
                        Text("合約基本費 / 幣別"),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 40,
                                width: 120,
                                child: TextFormField(
                                  initialValue:
                                      appState.contractForm["合約基本費"] ?? "3800",
                                  enabled: false,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 10),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1, color: Colors.black))),
                                ),
                              ),
                              Text(" / "),
                              CustomDropdownMenu(
                                initialSelection: appState.contractForm["合約幣別"],
                                labelname: "幣別",
                                menuSelections: [
                                  "TWD",
                                  "CNY",
                                  "USD",
                                  "EUR",
                                  "JPY",
                                ],
                                width: 120,
                                onSelect: (String? value) {
                                  appState.setContractForm(
                                      key: "合約幣別", value: value ?? "TWD");
                                },
                              )
                            ],
                          ),
                        )
                      ]),
                      TableRow(children: [
                        Text("下次繳費日期"),
                        Row(
                          children: [
                            Container(
                                margin: EdgeInsets.all(8),
                                height: 32,
                                width: 180,
                                child: CustomTextFormFieldDate(
                                  key: UniqueKey(),
                                  initialDate: appState.contractForm["下次收費日期"],
                                  onSelect: (String? value) {
                                    // print("You select date $value");
                                    appState.setContractForm(
                                        key: "下次收費日期", value: value ?? "");
                                  },
                                )),
                          ],
                        ),
                      ]),
                      TableRow(children: [
                        Text("已繳期數 / 總期數"),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 32,
                                  width: 40,
                                  child: TextFormField(
                                    initialValue:
                                        appState.contractForm["已繳期數"] ?? "0",
                                    onChanged: (value) {
                                      appState.setContractForm(
                                          key: "已繳期數", value: value);
                                    },
                                    validator: (value) => (value ?? "").isEmpty
                                        ? "This field is required"
                                        : null,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.only(left: 10),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: Colors.black))),
                                  ),
                                ),
                                Text(" / "),
                                SizedBox(
                                  height: 32,
                                  width: 40,
                                  child: TextFormField(
                                    initialValue:
                                        appState.contractForm["總期數"] ?? "24",
                                    enabled: false,
                                    decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.only(left: 10),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: Colors.black))),
                                  ),
                                ),
                              ],
                            )),
                      ]),
                      TableRow(children: [
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.top,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text("合約註記"),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 150,
                              child: TextFormField(
                                initialValue: appState.contractForm["合約註記"],
                                onChanged: (value) {
                                  appState.setContractForm(
                                      key: "合約註記", value: value);
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
                            ))
                      ])
                    ],
                  ),
                ),
              )
            ]));
  }
}
