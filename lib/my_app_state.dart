import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyAppState extends ChangeNotifier {
  String username = "John Doe";
  String email = "johndoe@example.com";

  final Map<String, String> dentalForm = {
    "牙技所名稱": "福家牙技所",
    "牙技所ID": "0000-0000-0000-0001",
    "牙技所統一編號": "",
    '牙技所聯絡人': "",
    "牙技所電話": "",
    '牙技所Email': "",
    '牙技所縣市': '請選擇',
    '牙技所鄉鎮市區': '請選擇',
    '牙技所地址': '',
    '牙技所狀態': "contact", // contact: 聯繫中, underContract： 合約中, terminated： 已解約
    '備註': "",
  };

  final Map<String, String> contractForm = {
    "合約ID": "C-10001",
    "合約種類": "服務平台合約",
    "合約編號": "",
    '合約名稱': "",
    "合約起始日": DateFormat('yyyy-MM-dd').format(DateTime.now()),
    '合約到期日': DateFormat('yyyy-MM-dd').format(DateTime(
        DateTime.now().year + 1, DateTime.now().month, DateTime.now().day)),
    '合約建立日': DateFormat('yyyy-MM-dd').format(DateTime.now()),
    '合約收費方案': "season", // month: 月繳, season: 季繳, year: 年繳
    '下次收費日期': DateFormat('yyyy-MM-dd').format(DateTime(
        DateTime.now().year, DateTime.now().month + 1, DateTime.now().day)),
    "已繳期數 / 總期數": "0 / 12",
    '合約註記': "",
  };

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

  void setUsername(String username) {
    this.username = username;
    notifyListeners();
  }

  void setEmail(String email) {
    this.email = email;
    notifyListeners();
  }
}
