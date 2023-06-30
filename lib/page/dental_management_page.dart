import 'package:flutter/material.dart';
import 'package:namer_app/components/custom/custom_page_title.dart';
import 'package:namer_app/services/dio_client.dart';
import 'package:namer_app/types.dart';

List<String> dentalBriefKeys = [
  "牙技所ID",
  "牙技所名稱",
  "牙技所統一編號",
  "牙技所狀態",
  "牙技所聯絡人",
  "牙技所地址",
  "牙技所電話",
  "牙技所Email"
];

class DentalManagementPage extends StatefulWidget {
  @override
  State<DentalManagementPage> createState() => _DentalManagementPageState();
}

class _DentalManagementPageState extends State<DentalManagementPage> {
  final DioClient client = DioClient();

  bool isLoading = true;
  String? errorText;
  dynamic _dentalDisplay = DentalDisplay.all;
  List<Map<String, dynamic>> _filteredTableData = [];
  Map<dynamic, List<Map<String, dynamic>>> _lookupTable = {};

  ButtonStyle filledButtonStyle = FilledButton.styleFrom(
      backgroundColor: Color.fromRGBO(176, 47, 1, 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)));

  List<Map<String, dynamic>> getFilteredTableData(dynamic filter) {
    if (_lookupTable.containsKey(filter)) return _lookupTable[filter] ?? [];

    final List<Map<String, dynamic>> results =
        _filteredTableData.where((element) {
      if (filter == DentalDisplay.all ||
          (filter == DentalDisplay.contact && element["牙技所狀態"] == "聯繫中") ||
          (filter == DentalDisplay.underContract &&
              element["牙技所狀態"] == "合約中") ||
          (filter == DentalDisplay.terminated && element["牙技所狀態"] == "已解約")) {
        return true;
      }

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
        children: dentalBriefKeys
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
          children: dentalBriefKeys
              .map(
                (key) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                  child: Text(key == "牙技所地址"
                      ? (row["牙技所縣市"].toString()) +
                          (row["牙技所鄉鎮市區"]).toString() +
                          (row[key] ?? "").toString()
                      : (row[key] ?? "").toString()),
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

    Future<void> startFetch() async {
      // await Future.delayed(Duration(seconds: 2));

      return client.getAllDentals().then((value) {
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
                      pageTitle: "牙技所管理", pageTitleIconData: Icons.dvr),
                  SizedBox(
                    height: 16,
                  ),
                  Row(children: [
                    Text(
                      "牙技所總覽",
                      style: TextStyle(fontSize: 18),
                    ),
                    Spacer(),
                    Container(
                      color: Colors.white,
                      width: 250,
                      height: 30,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: '查詢牙技所',
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
                                          onPressed: DentalDisplay.all ==
                                                  _dentalDisplay
                                              ? null
                                              : () {
                                                  setState(() {
                                                    _dentalDisplay =
                                                        DentalDisplay.all;
                                                    _filteredTableData =
                                                        getFilteredTableData(
                                                            DentalDisplay.all);
                                                  });
                                                },
                                          child: Text(
                                              "全部(${getFilteredTableData(DentalDisplay.all).length})")),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: FilledButton(
                                          style: filledButtonStyle,
                                          onPressed: DentalDisplay.contact ==
                                                  _dentalDisplay
                                              ? null
                                              : () {
                                                  setState(() {
                                                    _dentalDisplay =
                                                        DentalDisplay.contact;
                                                    _filteredTableData =
                                                        getFilteredTableData(
                                                            DentalDisplay
                                                                .contact);
                                                  });
                                                },
                                          child: Text(
                                              "聯繫中(${getFilteredTableData(DentalDisplay.contact).length})")),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: FilledButton(
                                          style: filledButtonStyle,
                                          onPressed:
                                              DentalDisplay.underContract ==
                                                      _dentalDisplay
                                                  ? null
                                                  : () {
                                                      setState(() {
                                                        _dentalDisplay =
                                                            DentalDisplay
                                                                .underContract;
                                                        _filteredTableData =
                                                            getFilteredTableData(
                                                                DentalDisplay
                                                                    .underContract);
                                                      });
                                                    },
                                          child: Text(
                                              "合約中(${getFilteredTableData(DentalDisplay.underContract).length})")),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: FilledButton(
                                          style: filledButtonStyle,
                                          onPressed: DentalDisplay.terminated ==
                                                  _dentalDisplay
                                              ? null
                                              : () {
                                                  setState(() {
                                                    _dentalDisplay =
                                                        DentalDisplay
                                                            .terminated;
                                                    _filteredTableData =
                                                        getFilteredTableData(
                                                            DentalDisplay
                                                                .terminated);
                                                  });
                                                },
                                          child: Text(
                                              "已解約(${getFilteredTableData(DentalDisplay.terminated).length})")),
                                    ),
                                    Spacer(),
                                    FilledButton(
                                        onPressed: () {
                                          Navigator.pushNamed(context,
                                              "/dental-management/new");
                                        },
                                        child: Text("新增牙技所")),
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
                                    2: FlexColumnWidth(1.4),
                                    3: FlexColumnWidth(1),
                                    4: FlexColumnWidth(1.2),
                                    5: FlexColumnWidth(2),
                                    6: FlexColumnWidth(1.5),
                                    7: FlexColumnWidth(2),
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
