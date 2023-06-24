import 'package:flutter/material.dart';
import 'package:namer_app/types.dart';

class CustomTableGroup extends StatelessWidget {
  const CustomTableGroup({super.key, required this.tableData});

  final TableData tableData;

  @override
  Widget build(BuildContext context) {
    int tableBodyIndex = 1;
    List<TableRow> tableRowChildren = [];

    while (tableData.rowData.isNotEmpty) {
      final TableRowData newRow = tableData.rowData.removeAt(0);

      tableRowChildren.add(TableRow(
        children: newRow.rowData
            .map((title) => Container(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                  color: newRow.isHeaderOrFooter
                      ? Color.fromRGBO(237, 76, 33, 1)
                      : tableBodyIndex % 2 == 1
                          ? Colors.transparent
                          : Color.fromRGBO(247, 139, 110, 0.5),
                  child: Text(
                    title,
                    style: TextStyle(
                        color: newRow.isHeaderOrFooter
                            ? Colors.white
                            : Colors.black),
                  ),
                ))
            .toList(),
      ));

      if (!newRow.isHeaderOrFooter) tableBodyIndex++;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          tableData.tableTitle,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          height: 8,
        ),
        Table(
          border: TableBorder.all(width: 1, color: Colors.grey),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: tableRowChildren,
        )
      ],
    );
  }
}
