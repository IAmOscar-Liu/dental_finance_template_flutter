enum PaymentMethods {
  month,
  season,
  year,
}

enum DentalStatus {
  contact,
  underContract,
  terminated,
}

enum ContractDisplay {
  all,
  service,
  equipmentRental,
  equipmentSale,

}

class TableRowData {
  const TableRowData({required this.isHeaderOrFooter, required this.rowData});

  final bool isHeaderOrFooter;
  final List<String >rowData;
}

class TableData {
  const TableData({required this.tableTitle, required this.rowData});

  final String tableTitle;
  final List<TableRowData> rowData;
}