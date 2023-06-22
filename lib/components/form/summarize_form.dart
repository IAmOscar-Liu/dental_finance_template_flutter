import 'package:flutter/material.dart';

final Map<String, String> dentalInfo = {
  "牙技所名稱": "福家牙技所",
  "牙技所ID": "0000-0000-0000-0001",
  "牙技所統一編號": "12345678",
  '牙技所聯絡人': "王小明",
  "牙技所電話": "02-2222-2222",
  '牙技所Email': "mydental@example.com",
  '牙技所地址': '新竹市東區工業東三路1號',
  '牙技所狀態': "已簽約",
  '備註': "全台第一家牙技所，價格公道！！！！",
};

final Map<String, String> contractInfo = {
  "合約ID": "C-10001",
  "合約種類": "服務平台合約",
  "合約編號": "C-12345678",
  '合約名稱': "福家牙技所服務平台合約",
  "合約起始日": "2023/06/01",
  '合約到期日': "2024/06/01",
  '合約建立日': '2023/05/01',
  '合約收費方案': "季繳",
  '下次收費日期': "2023/09/01",
  "已繳期數 / 總期數": "0 / 12",
  '合約註記': "記得要定期繳錢!!!",
};

class SummarizeForm extends StatelessWidget {
  const SummarizeForm({super.key});

  @override
  Widget build(BuildContext context) {
    if (dentalInfo.length % 2 == 1) dentalInfo.putIfAbsent("", () => "");
    if (contractInfo.length % 2 == 1) contractInfo.putIfAbsent("", () => "");

    return Padding(
      padding:
          const EdgeInsets.only(left: 8.0, right: 8.0, top: 16, bottom: 24),
      child: Column(
        children: [
          Text(
            "合約總覽",
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
              children: dentalInfo.entries
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
          Container(
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
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(8),
            color: Color.fromRGBO(241, 231, 231, 1),
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.spaceEvenly,
              children: contractInfo.entries
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
