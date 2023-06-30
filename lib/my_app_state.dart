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
  '牙技所地區': "請選擇",
  '牙技所縣市': '請選擇',
  '牙技所鄉鎮市區': '請選擇',
  '牙技所地址': '',
  '牙技所狀態': "合約中", // contact: 聯繫中, underContract： 合約中, terminated： 已解約
  '備註': "",
};

final Map<String, dynamic> initialContractForm = {
  "合約ID": "C-${Random().nextDouble().toString().substring(2, 7)}",
  '合約名稱': "",
  "合約編號": "",
  "合約簽約日": DateFormat('yyyy-MM-dd').format(DateTime.now()),
  "合約種類": "服務平台合約",
  "合約收費方案": "基本費＋訂單交易金額超額費",
  "備註": "",
  "服務平台細節": {
    "合約期限": 24,
    "基本費": 3800,
    "幣別": "TWD",
    "額度": 10000,
    "超額費": 0.01,
    "結算週期": "季繳"
  },
  "設備租賃細節": {
    "合約期限": 24,
    "設備ID": "E-001",
    "設備單價": 20000,
    "設備數量": 1,
    "幣別": "TWD",
    "結算週期": "季繳"
  },
  "設備買賣細節": {
    "設備ID": "E-001",
    "設備單價": 20000,
    "設備數量": 1,
    "幣別": "TWD",
  },
};

Map<String, String> setInitialDentalForm() {
  final Map<String, String> data = {};
  for (var entry in initialDentalForm.entries) {
    data.putIfAbsent(entry.key, () => entry.value);
  }
  return data;
}

Map<String, dynamic> setInitialContractForm() {
  final Map<String, dynamic> data = {};
  for (var entry in initialContractForm.entries) {
    data.putIfAbsent(entry.key, () => entry.value);
  }
  return data;
}

class MyAppState extends ChangeNotifier {
  String username = "John Doe";
  String email = "johndoe@example.com";

  String? dentalRegionErrorMessage;
  String? dentalAddressCityErrorMessage;
  String? dentalAddressDistrictErrorMessage;
  String? contractContractTypeErrorMessage;
  String? contractChargeMethodsErrorMessage;

  void setDentalRegionErrorMessage(String? value) {
    dentalRegionErrorMessage = value;
    notifyListeners();
  }

  void setDentalAddressCityErrorMessage(String? value) {
    dentalAddressCityErrorMessage = value;
    notifyListeners();
  }

  void setDentalAddressDistrictErrorMessage(String? value) {
    dentalAddressDistrictErrorMessage = value;
    notifyListeners();
  }

  void setContractContractTypeErrorMessage(String? value) {
    contractContractTypeErrorMessage = value;
    notifyListeners();
  }

  void setContractChargeMethodsErrorMessage(String? value) {
    contractChargeMethodsErrorMessage = value;
    notifyListeners();
  }

  Map<String, String> dentalForm = setInitialDentalForm();
  Map<String, dynamic> contractForm = setInitialContractForm();

  void setDentalForm({required String key, required String value}) {
    if (dentalForm.containsKey(key)) {
      dentalForm[key] = value;
      notifyListeners();
    }
  }

  void setContractForm({required String key, required dynamic value}) {
    if (contractForm.containsKey(key)) {
      contractForm[key] = value;
      notifyListeners();
    }
  }

  void resetDentalForms() {
    dentalForm = setInitialDentalForm();
    dentalForm["牙技所ID"] =
        "D-${Random().nextDouble().toString().substring(2, 5)}";

    notifyListeners();
  }

  void resetContractForms() {
    contractForm = setInitialContractForm();
    contractForm["合約ID"] =
        "C-${Random().nextDouble().toString().substring(2, 7)}";

    notifyListeners();
  }

  Map<String, String> selectedDental = {
    "牙技所名稱": "牙技所A",
    "牙技所ID": "D-001",
    "牙技所統一編號": "12345678",
    "牙技所聯絡人": "王小明",
    "牙技所電話": "02-1234-5678",
    "牙技所Email": "my-dental@dental.com",
    "牙技所網址": "http://my-dental.com",
    "牙技所地區": "亞洲-台灣",
    "牙技所縣市": "新竹市",
    "牙技所鄉鎮市區": "東區",
    "牙技所地址": "工業東三路1號5樓",
    "牙技所狀態": "合約中",
    "備註": ""
  };
  int selectedDentalID = 1;

  void setUsername(String username) {
    this.username = username;
    notifyListeners();
  }

  void setEmail(String email) {
    this.email = email;
    notifyListeners();
  }
}
