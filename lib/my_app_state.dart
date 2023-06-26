import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final Map<String, String> initialDentalForm = {
  "牙技所名稱": "",
  "牙技所ID": "D-${Random().nextDouble().toString().substring(2, 5)}",
  "牙技所統一編號": "",
  '牙技所聯絡人': "",
  "牙技所電話": "",
  '牙技所Email': "",
  '牙技所網址': "",
  '牙技所縣市': '請選擇',
  '牙技所鄉鎮市區': '請選擇',
  '牙技所地址': '',
  '牙技所狀態': "合約中", // contact: 聯繫中, underContract： 合約中, terminated： 已解約
  '備註': "",
};

final Map<String, String> initialContractForm = {
  "合約ID": "C-${Random().nextDouble().toString().substring(2, 7)}",
  "合約種類": "服務平台合約",
  "合約編號": "",
  '合約名稱': "",
  "合約起始日": DateFormat('yyyy-MM-dd').format(DateTime.now()),
  '合約到期日': DateFormat('yyyy-MM-dd').format(DateTime(
      DateTime.now().year + 1, DateTime.now().month, DateTime.now().day)),
  '合約建立日': DateFormat('yyyy-MM-dd').format(DateTime.now()),
  '合約收費方案': "Early Bird - 綁約兩年，每月3800",
  '合約收費方式': "季繳", // month: 月繳, season: 季繳, year: 年繳
  '下次收費日期': DateFormat('yyyy-MM-dd').format(DateTime(
      DateTime.now().year, DateTime.now().month + 1, DateTime.now().day)),
  "合約基本費": "3800",
  "合約幣別": "TWD",
  "已繳期數": "0",
  "總期數": "24",
  '合約註記': "",
};

Map<String, String> setInitialDentalForm() {
  final Map<String, String> data = {};
  for (var entry in initialDentalForm.entries) {
    data.putIfAbsent(entry.key, () => entry.value);
  }
  return data;
}

Map<String, String> setInitialContractForm() {
  final Map<String, String> data = {};
  for (var entry in initialContractForm.entries) {
    data.putIfAbsent(entry.key, () => entry.value);
  }
  return data;
}

class MyAppState extends ChangeNotifier {
  String username = "John Doe";
  String email = "johndoe@example.com";

  String? dentalAddressCityErrorMessage;
  String? dentalAddressDistrictErrorMessage;

  void setDentalAddressCityErrorMessage(String? value) {
    dentalAddressCityErrorMessage = value;
    notifyListeners();
  }

  void setDentalAddressDistrictErrorMessage(String? value) {
    dentalAddressDistrictErrorMessage = value;
    notifyListeners();
  }

  Map<String, String> dentalForm = setInitialDentalForm();
  Map<String, String> contractForm = setInitialContractForm();

  void setDentalForm({required String key, required String value}) {
    if (dentalForm.containsKey(key)) {
      dentalForm[key] = value;
      notifyListeners();
    }
  }

  void setContractForm({required String key, required String value}) {
    if (contractForm.containsKey(key)) {
      contractForm[key] = value;
      notifyListeners();
    }
  }

  void resetAllForms() {
    dentalForm = setInitialDentalForm();
    contractForm = setInitialContractForm();
    dentalForm["牙技所ID"] =
        "D-${Random().nextDouble().toString().substring(2, 5)}";
    contractForm["合約ID"] =
        "C-${Random().nextDouble().toString().substring(2, 7)}";

    notifyListeners();
  }

  void setUsername(String username) {
    this.username = username;
    notifyListeners();
  }

  void setEmail(String email) {
    this.email = email;
    notifyListeners();
  }
}
