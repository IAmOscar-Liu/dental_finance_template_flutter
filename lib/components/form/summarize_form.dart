import 'package:flutter/material.dart';
import 'package:namer_app/my_app_state.dart';
import 'package:provider/provider.dart';

// final Map<String, String> dentalFormSummary = {
//   "牙技所名稱": "福家牙技所",
//   "牙技所ID": "C-10001",
//   "牙技所統一編號": "12345678",
//   '牙技所聯絡人': "王小明",
//   "牙技所電話": "02-2222-2222",
//   '牙技所Email': "mydental@example.com",
//   '牙技所地址': '新竹市東區工業東三路1號',
//   '牙技所狀態': "合約中",
//   '備註': "全台第一家牙技所，價格公道！！！！",
// };

// final Map<String, String> contractFormSummary = {
//   "合約ID": "C-10001",
//   "合約種類": "服務平台合約",
//   "合約編號": "C-12345678",
//   '合約名稱': "福家牙技所服務平台合約",
//   "合約起始日": "2023-06-01",
//   '合約到期日': "2024-06-01",
//   '合約建立日': '2023-05-01',
//   '合約收費方案': "季繳",
//   '下次收費日期': "2023-09-01",
//   "已繳期數 / 總期數": "0 / 12",
//   '合約註記': "記得要定期繳錢!!!",
// };

class SummarizeForm extends StatelessWidget {
  const SummarizeForm({super.key, this.dentalFormOnly = false});
  final bool dentalFormOnly;

  @override
  Widget build(BuildContext context) {
    MyAppState appState = context.watch<MyAppState>();

    final Map<String, String> dentalForm =
        dentalFormOnly ? appState.dentalForm : appState.selectedDental;
    final Map<String, dynamic> contractForm = appState.contractForm;

    final Map<String, String> dentalFormSummary = {
      "牙技所名稱": dentalForm["牙技所名稱"]!,
      "牙技所ID": dentalForm["牙技所ID"]!,
      "牙技所統一編號": dentalForm["牙技所統一編號"]!,
      '牙技所聯絡人': dentalForm["牙技所聯絡人"]!,
      "牙技所電話": dentalForm["牙技所電話"]!,
      '牙技所Email': dentalForm["牙技所Email"]!,
      '牙技所地區': dentalForm["牙技所地區"]!,
      '牙技所地址':
          dentalForm["牙技所縣市"]! + dentalForm["牙技所鄉鎮市區"]! + dentalForm["牙技所地址"]!,
      '牙技所狀態': dentalForm["牙技所狀態"]!,
      '備註': dentalForm["備註"]!,
    };

    final Map<String, String> contractFormSummary = {
      '合約名稱': contractForm["合約名稱"]!,
      "合約編號": contractForm['合約編號']!,
      '合約簽約日': contractForm["合約簽約日"]!,
      "合約種類": contractForm["合約種類"]!,
      "合約收費方案": contractForm["合約收費方案"]!,
    };

    const String dollarSign = "\$";
    if (contractForm["合約種類"] == "服務平台合約") {
      contractFormSummary["合約期限"] =
          "${contractForm["服務平台細節"]["合約期限"].toString()}個月";
      contractFormSummary["合約基本費"] =
          "${dollarSign + contractForm["服務平台細節"]["基本費"].toString()} TWD";
      contractFormSummary["合約幣別"] = contractForm["服務平台細節"]["幣別"];
      contractFormSummary["合約額度"] =
          "${dollarSign + contractForm["服務平台細節"]["額度"].toString()} TWD";
      contractFormSummary["合約超額費"] =
          "${dollarSign + contractForm["服務平台細節"]["超額費"].toString()} TWD";
      contractFormSummary["合約結算週期"] = contractForm["服務平台細節"]["結算週期"];
    } else if (contractForm["合約種類"] == "設備租賃合約") {
      contractFormSummary["合約期限"] =
          "${contractForm["設備租賃細節"]["合約期限"].toString()}個月";
      contractFormSummary["合約設備ID"] = contractForm["設備租賃細節"]["設備ID"];
      contractFormSummary["合約設備單價"] =
          "${dollarSign + contractForm["設備租賃細節"]["設備單價"].toString()} TWD";
      contractFormSummary["合約設備數量"] =
          "${contractForm["設備租賃細節"]["設備數量"].toString()} 件";
      contractFormSummary["合約幣別"] = contractForm["設備租賃細節"]["幣別"];
      contractFormSummary["合約結算週期"] = contractForm["設備租賃細節"]["結算週期"];
    } else if (contractForm["合約種類"] == "設備買賣合約") {
      contractFormSummary["合約設備ID"] = contractForm["設備買賣細節"]["設備ID"];
      contractFormSummary["合約設備單價"] =
          "${dollarSign + contractForm["設備買賣細節"]["設備單價"].toString()} TWD";
      contractFormSummary["合約設備數量"] =
          "${contractForm["設備買賣細節"]["設備數量"].toString()} 件";
      contractFormSummary["合約幣別"] = contractForm["設備買賣細節"]["幣別"];
    }

    contractFormSummary["備註"] = contractForm["備註"];

    if (dentalFormSummary.length % 2 == 1) {
      dentalFormSummary.putIfAbsent("", () => "");
    }
    if (contractFormSummary.length % 2 == 1) {
      contractFormSummary.putIfAbsent("", () => "");
    }

    return Padding(
      padding:
          const EdgeInsets.only(left: 8.0, right: 8.0, top: 16, bottom: 24),
      child: Column(
        children: [
          Text(
            dentalFormOnly ? "牙技所總覽" : "合約總覽",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width: double.infinity,
            color: Color.fromRGBO(237, 76, 33, 1),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                "牙技所資料",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(8),
            color: Color.fromRGBO(241, 231, 231, 1),
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.spaceEvenly,
              children: dentalFormSummary.entries
                  .map((entry) => ConstrainedBox(
                        constraints:
                            BoxConstraints(minWidth: 300, maxWidth: 400),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(entry.key),
                            Spacer(),
                            Text(entry.value)
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          dentalFormOnly
              ? Container()
              : Container(
                  width: double.infinity,
                  color: Color.fromRGBO(237, 76, 33, 1),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      "合約資料",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
          dentalFormOnly
              ? Container()
              : Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(8),
                  color: Color.fromRGBO(241, 231, 231, 1),
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    alignment: WrapAlignment.spaceEvenly,
                    children: contractFormSummary.entries
                        .map((entry) => ConstrainedBox(
                              constraints:
                                  BoxConstraints(minWidth: 300, maxWidth: 400),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(entry.key),
                                  Spacer(),
                                  Text(entry.value)
                                ],
                              ),
                            ))
                        .toList(),
                  ),
                ),
        ],
      ),
    );
  }
}
