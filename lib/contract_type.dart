Map<String, List<String>> contractChargeMethods = {
  "服務平台合約": ["基本費＋訂單交易金額超額費"],
  "設備租賃合約": ["設備租賃收費方案A"],
  "設備買賣合約": ["設備買賣收費方案A"]
};

List<String> contractType =
    contractChargeMethods.entries.map((e) => e.key).toList();
