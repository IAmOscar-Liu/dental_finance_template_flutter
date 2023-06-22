import 'package:flutter/material.dart';
import 'package:namer_app/components/custom_text_form_field_date.dart';
import 'package:namer_app/my_app_state.dart';
import 'package:provider/provider.dart';

class ContractForm extends StatelessWidget {
  const ContractForm({super.key});

  @override
  Widget build(BuildContext context) {
    MyAppState appState = context.watch<MyAppState>();
    String? paymentMethods = appState.contractForm["合約收費方案"];

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
                    Text(
                      "牙技所名稱",
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "福家牙技所",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ]),
                  TableRow(children: [
                    Text(
                      "合約ID",
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("C-10001"),
                    ),
                  ]),
                  TableRow(children: [
                    Text(
                      "合約種類",
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(appState.contractForm["合約種類"] ?? "服務平台合約"),
                    ),
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
                            appState.setContractForm(key: "合約編號", value: value);
                          },
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
                            appState.setContractForm(key: "合約名稱", value: value);
                          },
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
                    Text("收費方案"),
                    Wrap(
                      spacing: 12,
                      runSpacing: 6,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Radio(
                                value: "month",
                                groupValue: paymentMethods,
                                onChanged: (String? value) {
                                  appState.setContractForm(
                                      key: "合約收費方案", value: value ?? "season");
                                }),
                            Text("月繳"),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Radio(
                                value: "season",
                                groupValue: paymentMethods,
                                onChanged: (String? value) {
                                  appState.setContractForm(
                                      key: "合約收費方案", value: value ?? "season");
                                }),
                            Text("季繳"),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Radio(
                                value: "year",
                                groupValue: paymentMethods,
                                onChanged: (String? value) {
                                  appState.setContractForm(
                                      key: "合約收費方案", value: value ?? "season");
                                }),
                            Text("年繳"),
                          ],
                        ),
                      ],
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
                              initialDate: appState.contractForm["下次收費日期"],
                              onSelect: (String? value) {
                                // print("You select date $value");
                                appState.setContractForm(key: "下次收費日期", value: value ?? "");
                              },
                            )),
                      ],
                    ),
                  ]),
                  TableRow(children: [
                    Text("已繳期數 / 總期數"),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("1 / 12")),
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
                              appState.setContractForm(key: "合約註記", value: value);
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
