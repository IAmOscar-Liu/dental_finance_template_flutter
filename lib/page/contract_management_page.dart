import 'package:flutter/material.dart';
import 'package:namer_app/components/custom/custom_page_title.dart';
import 'package:namer_app/services/dio_client.dart';
import 'package:namer_app/types.dart';

List<String> contractBriefKeys = [
  "合約ID",
  "合約編號",
  "合約名稱",
  "合約種類",
  "合約簽約日",
  "牙技所名稱",
  "牙技所統一編號",
  "牙技所狀態",
  "合約細節",
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

class ContractManagementPage extends StatefulWidget {
  const ContractManagementPage({super.key});

  @override
  State<ContractManagementPage> createState() => _ContractManagementPageState();
}

class _ContractManagementPageState extends State<ContractManagementPage> {
  final DioClient _client = DioClient();

  bool _isLoading = true;
  String? _errorText;
  dynamic _contractDisplay = ContractDisplay.all;
  // List<Map<String, String>> _filteredTableData = dummyTableData;
  List<Map<String, dynamic>> _filteredTableData = [];
  Map<dynamic, List<Map<String, dynamic>>> _lookupTable = {
    // ContractDisplay.all: dummyTableData
  };

  ButtonStyle filledButtonStyle = FilledButton.styleFrom(
      backgroundColor: Color.fromRGBO(176, 47, 1, 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)));

  List<Map<String, dynamic>> getFilteredTableData(dynamic filter) {
    if (_lookupTable.containsKey(filter)) return _lookupTable[filter] ?? [];

    final List<Map<String, dynamic>> results =
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
                  child: key == "合約細節"
                      ? Center(
                          child: Text(key),
                        )
                      : Text(key),
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
                  child: key == "合約細節"
                      ? TextButton(onPressed: () {}, child: Text("查看細節"))
                      : Text((row[key] ?? "").toString()),
                ),
              )
              .toList(),
        )));
    return tableRows;
  }

  @override
  void initState() {
    setState(() {
      _isLoading = true;
      _errorText = null;
    });

    Future<void> startFetch() async {
      // await Future.delayed(Duration(seconds: 2));

      return _client.getContractsBrief().then((value) {
        setState(() {
          _filteredTableData = value;
          _isLoading = false;
        });
      }).catchError((error) {
        setState(() {
          _errorText = error.toString();
          _isLoading = false;
        });
      });
    }

    startFetch();
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
              constraints: BoxConstraints(maxWidth: 1080),
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
                  _isLoading
                      ? SizedBox(
                          height: 300,
                          child: Center(child: CircularProgressIndicator()))
                      : (_errorText ?? "").isNotEmpty
                          ? SizedBox(
                              height: 300,
                              child: Center(
                                  child: Text(
                                _errorText!,
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
                                        onPressed: () {
                                          Navigator.pushNamed(context,
                                              "/contract-management/new");
                                        },
                                        child: Text("新增合約")),
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
                                    2: FlexColumnWidth(2),
                                    3: FlexColumnWidth(1.2),
                                    4: FlexColumnWidth(1.2),
                                    5: FlexColumnWidth(1.2),
                                    6: FlexColumnWidth(1.3),
                                    7: FlexColumnWidth(1),
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
