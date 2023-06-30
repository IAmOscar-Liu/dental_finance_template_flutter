import 'package:flutter/material.dart';
import 'package:namer_app/components/form/contract-detail/equipment_rental.dart';
import 'package:namer_app/components/form/contract-detail/service_platform.dart';
import 'package:namer_app/my_app_state.dart';

import 'contract-detail/equipment_purchase.dart';

class ContractFormAdcvance extends StatelessWidget {
  const ContractFormAdcvance(
      {super.key, required this.formKey, required this.appState});

  final Key formKey;
  final MyAppState appState;

  @override
  Widget build(BuildContext context) {
    List<TableRow> tableRow = [
      TableRow(children: [
        Text(
          "合約種類",
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(appState.contractForm["合約種類"]),
        ),
      ]),
      TableRow(children: [
        Text(
          "合約收費方案",
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(appState.contractForm["合約收費方案"]),
        ),
      ]),
    ];

    if (appState.contractForm["合約種類"] == "服務平台合約") {
      tableRow.addAll(getServicePlatformTableRow(
          schema: appState.contractForm["合約收費方案"], appState: appState));
    } else if (appState.contractForm["合約種類"] == "設備租賃合約") {
      tableRow.addAll(getEquipmentRentalTableRow(
          schema: appState.contractForm["合約收費方案"], appState: appState));
    } else if (appState.contractForm["合約種類"] == "設備買賣合約") {
      tableRow.addAll(getEquipmentPurchaseTableRow(
          schema: appState.contractForm["合約收費方案"], appState: appState));
    }

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
                  children: tableRow,
                )),
            Spacer()
          ],
        ));
  }
}
