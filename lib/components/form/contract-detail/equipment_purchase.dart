import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:namer_app/components/custom/custom_dropdown_menu.dart';
import 'package:namer_app/components/custom/custom_radio_group.dart';
import 'package:namer_app/my_app_state.dart';

void setContractDetail(
    {required MyAppState appState,
    required String key,
    required dynamic value}) {
  var detail = appState.contractForm["設備買賣細節"];
  detail[key] = value;

  appState.setContractForm(key: "設備買賣細節", value: detail);
}

List<TableRow> getEquipmentPurchaseTableRow(
    {required String schema, required MyAppState appState}) {
  if (schema == "設備買賣收費方案A") {
    return [
      TableRow(children: [
        Text(
          "設備ID",
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 32,
                width: 250,
                child: TextFormField(
                  initialValue:
                      appState.contractForm["設備買賣細節"]['設備ID'].toString(),
                  onChanged: (value) {
                    setContractDetail(
                        appState: appState, key: "設備ID", value: value);
                  },
                  validator: (value) =>
                      (value ?? "").isEmpty ? "This field is required" : null,
                  decoration: InputDecoration(
                      hintText: "e.g. E-001",
                      contentPadding: EdgeInsets.only(left: 10),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Colors.grey))),
                ),
              ),
            ],
          ),
        ),
      ]),
      TableRow(children: [
        Text(
          "設備單價",
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
                      appState.contractForm["設備買賣細節"]['設備單價'].toString(),
                  onChanged: (value) {
                    appState.setContractForm(
                        key: "設備單價", value: double.parse(value));
                  },
                  validator: (value) =>
                      (value ?? "").isEmpty ? "This field is required" : null,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                      hintText: "e.g. 20000",
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
          "設備數量",
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
                      appState.contractForm["設備買賣細節"]['設備數量'].toString(),
                  onChanged: (value) {
                    appState.setContractForm(
                        key: "設備數量", value: double.parse(value));
                  },
                  validator: (value) =>
                      (value ?? "").isEmpty ? "This field is required" : null,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                      hintText: "e.g. 1",
                      contentPadding: EdgeInsets.only(left: 10),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Colors.grey))),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text("件")
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
    ];
  }

  return [];
}
