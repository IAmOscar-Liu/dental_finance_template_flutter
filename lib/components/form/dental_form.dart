import 'package:flutter/material.dart';
import 'package:namer_app/components/custom/custom_dropdown_menu.dart';
import 'package:namer_app/components/custom/custom_radio_group.dart';
import 'package:namer_app/district.dart';
import 'package:namer_app/my_app_state.dart';
import 'package:provider/provider.dart';

class DentalForm extends StatelessWidget {
  const DentalForm({super.key, required this.formKey});

  final Key formKey;

  @override
  Widget build(BuildContext context) {
    MyAppState appState = context.watch<MyAppState>();
    String? dentalStatus = appState.dentalForm["牙技所狀態"];

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
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.top,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("牙技所名稱"),
                      )),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.top,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 64,
                              child: TextFormField(
                                initialValue: appState.dentalForm["牙技所名稱"],
                                onChanged: (value) {
                                  appState.setDentalForm(
                                      key: "牙技所名稱", value: value);
                                },
                                validator: (value) => (value ?? "").isEmpty
                                    ? "This field is required"
                                    : null,
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                expands: true,
                                decoration: InputDecoration(
                                    hintText: "e.g. XX牙技所",
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
                                "選擇既有牙技所",
                                style: TextStyle(fontSize: 12),
                              )),
                        ],
                      ),
                    ),
                  ),
                ]),
                TableRow(children: [
                  Text("牙技所ID"),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(appState.dentalForm["牙技所ID"] ?? "Pending"),
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
                        validator: (value) => (value ?? "").isEmpty
                            ? "This field is required"
                            : null,
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 32,
                      child: TextFormField(
                        initialValue: appState.dentalForm["牙技所聯絡人"],
                        onChanged: (value) {
                          appState.setDentalForm(key: "牙技所聯絡人", value: value);
                        },
                        validator: (value) => (value ?? "").isEmpty
                            ? "This field is required"
                            : null,
                        decoration: InputDecoration(
                            hintText: "e.g. 王小明",
                            contentPadding: EdgeInsets.only(left: 10),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2, color: Colors.grey))),
                      ),
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
                        onChanged: (value) {
                          appState.setDentalForm(key: "牙技所電話", value: value);
                        },
                        validator: (value) => (value ?? "").isEmpty
                            ? "This field is required"
                            : null,
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
                        onChanged: (value) {
                          appState.setDentalForm(key: "牙技所Email", value: value);
                        },
                        validator: (value) => (value ?? "").isEmpty
                            ? "This field is required"
                            : null,
                        decoration: InputDecoration(
                            hintText: "e.g. example@example.com",
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
                          },
                          errorText: appState.dentalAddressCityErrorMessage,
                        ),
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
                          },
                          errorText: appState.dentalAddressDistrictErrorMessage,
                        )
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
                        validator: (value) => (value ?? "").isEmpty
                            ? "This field is required"
                            : null,
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
                      Text("牙技所網址"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 32,
                          child: TextFormField(
                            initialValue: appState.dentalForm["牙技所網址"],
                            onChanged: (value) {
                              appState.setDentalForm(
                                  key: "牙技所網址", value: value);
                            },
                            validator: (value) => (value ?? "").isEmpty
                                ? "This field is required"
                                : null,
                            keyboardType: TextInputType.url,
                            decoration: InputDecoration(
                                hintText: "e.g. https://example.com",
                                contentPadding: EdgeInsets.only(left: 10),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.grey))),
                          ),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Text("牙技所狀態"),
                      CustomRadioGroup(
                          fallbackValue: "合約中",
                          groupOptions: ["聯繫中", "合約中", "已解約"],
                          groupValue: dentalStatus ?? "合約中",
                          onChange: (String value) {
                            appState.setDentalForm(key: "牙技所狀態", value: value);
                          })
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
