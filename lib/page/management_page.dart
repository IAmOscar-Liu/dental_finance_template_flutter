import 'package:flutter/material.dart';
import 'package:namer_app/components/custom/custom_page_title.dart';
import 'package:namer_app/services/dio_client.dart';
import 'package:namer_app/types.dart';

List<String> contractBriefKeys = [
  "合約ID",
  "合約編號",
  "合約種類",
  "合約名稱",
  "牙技所ID",
  "牙技所名稱",
  "牙技所狀態",
  "合約起始日",
  "合約到期日"
];

// List<Map<String, String>> dummyTableData = [
//   {
//     "合約ID": "C-10001",
//     "合約編號": "C2023060001-1",
//     "合約名稱": "牙技所A平台服務合約",
//     "牙技所ID": "D-001",
//     "牙技所名稱": "牙技所A",
//     "合約種類": "服務平台合約",
//     "牙技所狀態": "合約中",
//     "合約起始日": "2023-06-01",
//     "合約到期日": "2023-06-01",
//   },
//   {
//     "合約ID": "C-10002",
//     "合約編號": "C2023060001-2",
//     "合約名稱": "牙技所A設備租賃合約",
//     "牙技所ID": "D-001",
//     "牙技所名稱": "牙技所A",
//     "合約種類": "設備租賃合約",
//     "牙技所狀態": "合約中",
//     "合約起始日": "2023-06-01",
//     "合約到期日": "2023-06-01",
//   },
//   {
//     "合約ID": "C-10003",
//     "合約編號": "C2023060002-1",
//     "合約名稱": "牙技所B平台服務合約",
//     "牙技所ID": "D-002",
//     "牙技所名稱": "牙技所B",
//     "合約種類": "服務平台合約",
//     "牙技所狀態": "合約中",
//     "合約起始日": "2023-06-01",
//     "合約到期日": "2023-06-01",
//   }
// ];

class ManagementPage extends StatefulWidget {
  const ManagementPage({super.key});

  @override
  State<ManagementPage> createState() => _ManagementPageState();
}

class _ManagementPageState extends State<ManagementPage> {
  final DioClient client = DioClient();

  bool isLoading = true;
  String? errorText;
  dynamic _contractDisplay = ContractDisplay.all;
  // List<Map<String, String>> _filteredTableData = dummyTableData;
  List<Map<String, String>> _filteredTableData = [];
  Map<dynamic, List<Map<String, String>>> _lookupTable = {
    // ContractDisplay.all: dummyTableData
  };

  ButtonStyle filledButtonStyle = FilledButton.styleFrom(
      backgroundColor: Color.fromRGBO(176, 47, 1, 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)));

  List<Map<String, String>> getFilteredTableData(dynamic filter) {
    if (_lookupTable.containsKey(filter)) return _lookupTable[filter] ?? [];

    final List<Map<String, String>> results =
        _filteredTableData.where((element) {
      if (filter == ContractDisplay.all ||
          (filter == ContractDisplay.service && element["合約種類"] == "服務平台合約") ||
          (filter == ContractDisplay.equipmentRental &&
              element["合約種類"] == "設備租賃合約") ||
          (filter == ContractDisplay.equipmentSale &&
              element["合約種類"] == "設備買賣合約")) return true;

      return false;
    }).toList();

    setState(() {
      _lookupTable.putIfAbsent(filter, () => results);
    });
    return results;
  }

  List<TableRow> getTableRows() {
    List<TableRow> tableRows = [
      TableRow(
        decoration: BoxDecoration(color: Color.fromRGBO(236, 136, 100, 1)),
        children: contractBriefKeys
            .map((key) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                  child: Text(key),
                ))
            .toList(),
      ),
    ];
    tableRows.addAll(_filteredTableData.map((row) => TableRow(
          decoration: BoxDecoration(
              color: Color.fromRGBO(236, 209, 209, 1),
              border: Border(
                  bottom: BorderSide(
                      width: 1, color: Color.fromRGBO(0, 0, 0, 0.3)))),
          children: contractBriefKeys
              .map(
                (key) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                  child: Text(row[key] ?? ""),
                ),
              )
              .toList(),
        )));
    return tableRows;
  }

  @override
  void initState() {
    setState(() {
      isLoading = true;
      errorText = null;
    });

    client.getContractsBrief().then((value) {
      setState(() {
        _filteredTableData = value;
        isLoading = false;
      });
    }).catchError((error) {
      setState(() {
        errorText = error.toString();
        isLoading = false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 24, top: 24, right: 24, bottom: 36),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 1000),
              child: Column(
                children: [
                  CustomPageTitle(
                      pageTitle: "合約管理", pageTitleIconData: Icons.dvr),
                  SizedBox(
                    height: 16,
                  ),
                  Row(children: [
                    Text(
                      "合約總覽",
                      style: TextStyle(fontSize: 18),
                    ),
                    Spacer(),
                    Container(
                      color: Colors.white,
                      width: 250,
                      height: 30,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: '查詢合約',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 12,
                  ),
                  isLoading
                      ? SizedBox(
                          height: 300,
                          child: Center(child: CircularProgressIndicator()))
                      : (errorText ?? "").isNotEmpty
                          ? SizedBox(
                              height: 300,
                              child: Center(
                                  child: Text(
                                errorText!,
                                style: TextStyle(color: Colors.red),
                              )))
                          : Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: FilledButton(
                                          style: filledButtonStyle,
                                          onPressed: ContractDisplay.all ==
                                                  _contractDisplay
                                              ? null
                                              : () {
                                                  setState(() {
                                                    _contractDisplay =
                                                        ContractDisplay.all;
                                                    _filteredTableData =
                                                        getFilteredTableData(
                                                            ContractDisplay
                                                                .all);
                                                  });
                                                },
                                          child: Text(
                                              "全部(${getFilteredTableData(ContractDisplay.all).length})")),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: FilledButton(
                                          style: filledButtonStyle,
                                          onPressed: ContractDisplay.service ==
                                                  _contractDisplay
                                              ? null
                                              : () {
                                                  setState(() {
                                                    _contractDisplay =
                                                        ContractDisplay.service;
                                                    _filteredTableData =
                                                        getFilteredTableData(
                                                            ContractDisplay
                                                                .service);
                                                  });
                                                },
                                          child: Text(
                                              "服務平台(${getFilteredTableData(ContractDisplay.service).length})")),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: FilledButton(
                                          style: filledButtonStyle,
                                          onPressed:
                                              ContractDisplay.equipmentRental ==
                                                      _contractDisplay
                                                  ? null
                                                  : () {
                                                      setState(() {
                                                        _contractDisplay =
                                                            ContractDisplay
                                                                .equipmentRental;
                                                        _filteredTableData =
                                                            getFilteredTableData(
                                                                ContractDisplay
                                                                    .equipmentRental);
                                                      });
                                                    },
                                          child: Text(
                                              "設備租賃(${getFilteredTableData(ContractDisplay.equipmentRental).length})")),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: FilledButton(
                                          style: filledButtonStyle,
                                          onPressed:
                                              ContractDisplay.equipmentSale ==
                                                      _contractDisplay
                                                  ? null
                                                  : () {
                                                      setState(() {
                                                        _contractDisplay =
                                                            ContractDisplay
                                                                .equipmentSale;
                                                        _filteredTableData =
                                                            getFilteredTableData(
                                                                ContractDisplay
                                                                    .equipmentSale);
                                                      });
                                                    },
                                          child: Text(
                                              "設備買賣(${getFilteredTableData(ContractDisplay.equipmentSale).length})")),
                                    ),
                                    Spacer(),
                                    FilledButton(
                                        onPressed: () {}, child: Text("新增合約")),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Table(
                                  defaultVerticalAlignment:
                                      TableCellVerticalAlignment.middle,
                                  columnWidths: {
                                    0: FlexColumnWidth(1),
                                    1: FlexColumnWidth(1.5),
                                    2: FlexColumnWidth(1.5),
                                    3: FlexColumnWidth(2),
                                    4: FlexColumnWidth(1),
                                    5: FlexColumnWidth(1.5),
                                    6: FlexColumnWidth(1),
                                    7: FlexColumnWidth(1.2),
                                    8: FlexColumnWidth(1.2),
                                  },
                                  children: getTableRows(),
                                )
                              ],
                            ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
