import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:namer_app/components/custom/custom_dropdown_menu.dart';
import 'package:namer_app/components/custom/custom_radio_group.dart';
import 'package:namer_app/my_app_state.dart';

void setContractDetail(
    {required MyAppState appState,
    required String key,
    required dynamic value}) {
  var detail = appState.contractForm["服務平台細節"];
  detail[key] = value;

  appState.setContractForm(key: "服務平台細節", value: detail);
}

List<TableRow> getServicePlatformTableRow(
    {required String schema, required MyAppState appState}) {
  if (schema == "基本費＋訂單交易金額超額費") {
    return [
      TableRow(children: [
        Text(
          "合約期限",
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 32,
                width: 50,
                child: TextFormField(
                  initialValue:
                      appState.contractForm["服務平台細節"]['合約期限'].toString(),
                  onChanged: (value) {
                    setContractDetail(
                        appState: appState,
                        key: "合約期限",
                        value: int.parse(value));
                  },
                  validator: (value) =>
                      (value ?? "").isEmpty ? "This field is required" : null,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                      hintText: "e.g. 24",
                      contentPadding: EdgeInsets.only(left: 10),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Colors.grey))),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text("個月")
            ],
          ),
        ),
      ]),
      TableRow(children: [
        Text(
          "基本費",
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 32,
                width: 120,
                child: TextFormField(
                  initialValue:
                      appState.contractForm["服務平台細節"]['基本費'].toString(),
                  onChanged: (value) {
                    setContractDetail(
                        appState: appState,
                        key: "基本費",
                        value: int.parse(value));
                  },
                  validator: (value) =>
                      (value ?? "").isEmpty ? "This field is required" : null,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                      hintText: "e.g. 3800",
                      contentPadding: EdgeInsets.only(left: 10),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Colors.grey))),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text("TWD")
            ],
          ),
        ),
      ]),
      TableRow(children: [
        Text("幣別"),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomDropdownMenu(
              labelname: "幣別",
              initialSelection: "TWD",
              menuSelections: ["TWD", "USD", "CNY", "EUR", "JPY"],
              onSelect: (String? value) {
                setContractDetail(
                    appState: appState, key: "幣別", value: value ?? "TWD");
              }),
        )
      ]),
      TableRow(children: [
        Text(
          "額度",
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 32,
                width: 150,
                child: TextFormField(
                  initialValue:
                      appState.contractForm["服務平台細節"]['額度'].toString(),
                  onChanged: (value) {
                    setContractDetail(
                        appState: appState, key: "額度", value: int.parse(value));
                  },
                  validator: (value) =>
                      (value ?? "").isEmpty ? "This field is required" : null,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                      hintText: "e.g. 10000",
                      contentPadding: EdgeInsets.only(left: 10),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Colors.grey))),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text("TWD")
            ],
          ),
        ),
      ]),
      TableRow(children: [
        Text(
          "超額費",
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 32,
                width: 150,
                child: TextFormField(
                  initialValue:
                      appState.contractForm["服務平台細節"]['超額費'].toString(),
                  onChanged: (value) {
                    appState.setContractForm(
                        key: "超額費", value: double.parse(value));
                  },
                  validator: (value) =>
                      (value ?? "").isEmpty ? "This field is required" : null,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
                  ],
                  decoration: InputDecoration(
                      hintText: "e.g. 0.01",
                      contentPadding: EdgeInsets.only(left: 10),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Colors.grey))),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text("TWD")
            ],
          ),
        ),
      ]),
      TableRow(children: [
        Text("結算週期"),
        CustomRadioGroup(
            fallbackValue: "季繳",
            groupOptions: ["月繳", "季繳", "年繳"],
            groupValue: appState.contractForm["服務平台細節"]["結算週期"] ?? "季繳",
            onChange: (String value) {
              setContractDetail(appState: appState, key: "結算週期", value: value);
            })
      ]),
    ];
  }

  return [];
}
