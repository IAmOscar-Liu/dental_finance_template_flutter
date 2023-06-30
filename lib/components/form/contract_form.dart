import 'package:flutter/material.dart';
import 'package:namer_app/components/custom/custom_dropdown_menu.dart';
import 'package:namer_app/components/custom/custom_text_form_field_date.dart';
import 'package:namer_app/contract_type.dart';
import 'package:namer_app/my_app_state.dart';

class ContractForm extends StatelessWidget {
  const ContractForm(
      {super.key, required this.formKey, required this.appState});

  final Key formKey;
  final MyAppState appState;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Row(
          children: [
            Spacer(),
            Expanded(
                flex: 5,
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
                          child: Row(
                            children: [
                              (appState.selectedDental["牙技所名稱"] ?? "").isEmpty
                                  ? Container()
                                  : Text(
                                      appState.selectedDental["牙技所名稱"] ?? "",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                              (appState.selectedDental["牙技所名稱"] ?? "").isEmpty
                                  ? Container()
                                  : Spacer(flex: 1),
                              (appState.selectedDental["牙技所名稱"] ?? "").isEmpty
                                  ? FilledButton(
                                      onPressed: () {}, child: Text("選擇牙技所"))
                                  : TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "重新選擇牙技所",
                                        style: TextStyle(color: Colors.blue),
                                      )),
                            ],
                          )),
                    ]),
                    TableRow(children: [
                      Text(
                        "牙技所ID",
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            (appState.selectedDental["牙技所ID"] ?? "未選擇牙技所")),
                      ),
                    ]),
                    TableRow(children: [
                      Text(
                        "牙技所統一編號",
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            (appState.selectedDental["牙技所統一編號"] ?? "未選擇牙技所")),
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
                        "合約簽約日",
                      ),
                      Row(
                        children: [
                          Container(
                              margin: EdgeInsets.all(8),
                              height: 32,
                              width: 180,
                              child: CustomTextFormFieldDate(
                                key: UniqueKey(),
                                initialDate: appState.contractForm["合約簽約日"],
                                onSelect: (String? value) {
                                  // print("You select date $value");
                                  appState.setContractForm(
                                      key: "合約簽約日", value: value ?? "");
                                },
                              )),
                        ],
                      ),
                    ]),
                    TableRow(children: [
                      Text("合約種類"),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: CustomDropdownMenu(
                          key: UniqueKey(),
                          labelname: '合約種類',
                          initialSelection: appState.contractForm["合約種類"],
                          menuSelections: contractType,
                          onSelect: (String? value) {
                            // print("You select $value");
                            appState.setContractForm(
                                key: "合約種類", value: value ?? "服務平台合約");
                            appState.setContractForm(
                                key: "合約收費方案", value: "請選擇");
                          },
                          errorText: appState.contractContractTypeErrorMessage,
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Text("合約收費方案"),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: CustomDropdownMenu(
                          key: UniqueKey(),
                          labelname: '合約收費方案',
                          initialSelection: appState.contractForm["合約收費方案"],
                          menuSelections: contractChargeMethods[
                                  appState.contractForm["合約種類"]] ??
                              ["請選擇"],
                          onSelect: (String? value) {
                            // print("You select $value");
                            appState.setContractForm(
                                key: "合約收費方案", value: value ?? "請選擇");
                          },
                          errorText: appState.contractChargeMethodsErrorMessage,
                        ),
                      )
                    ]),
                  ],
                )),
            Spacer()
          ],
        ));
  }
}
