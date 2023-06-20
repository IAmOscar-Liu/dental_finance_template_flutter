import 'package:flutter/material.dart';
import 'package:namer_app/components/custom_text_form_field_date.dart';

enum PaymentMethods {
  month,
  season,
  year,
}

class ContractForm extends StatefulWidget {
  const ContractForm({super.key});

  @override
  State<ContractForm> createState() => _ContractFormState();
}

class _ContractFormState extends State<ContractForm> {
  PaymentMethods? _paymentMethods = PaymentMethods.season;

  @override
  Widget build(BuildContext context) {
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
                      child: Text("服務平台合約"),
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
                      "合約起始日",
                    ),
                    Row(
                      children: [
                        Container(
                            margin: EdgeInsets.all(8),
                            height: 32,
                            width: 180,
                            child: CustomTextFormFieldDate(
                              onSelect: (String value) {
                                print("You select date $value");
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
                              onSelect: (String value) {
                                print("You select date $value");
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
                              onSelect: (String value) {
                                print("You select date $value");
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
                                value: PaymentMethods.month,
                                groupValue: _paymentMethods,
                                onChanged: (PaymentMethods? value) {
                                  setState(() {
                                    _paymentMethods = value;
                                  });
                                }),
                            Text("月繳"),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Radio(
                                value: PaymentMethods.season,
                                groupValue: _paymentMethods,
                                onChanged: (PaymentMethods? value) {
                                  setState(() {
                                    _paymentMethods = value;
                                  });
                                }),
                            Text("季繳"),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Radio(
                                value: PaymentMethods.year,
                                groupValue: _paymentMethods,
                                onChanged: (PaymentMethods? value) {
                                  setState(() {
                                    _paymentMethods = value;
                                  });
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
                              onSelect: (String value) {
                                print("You select date $value");
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
