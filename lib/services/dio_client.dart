import "package:dio/dio.dart";

void handleDioException(DioException e) {
  // The request was made and the server responded with a status code
  // that falls out of the range of 2xx and is also not 304.
  if (e.response != null) {
    print('Dio error!');
    print('STATUS: ${e.response?.statusCode}');
    print('DATA: ${e.response?.data}');
    print('HEADERS: ${e.response?.headers}');
  } else {
    // Error due to setting up or sending the request
    print('Error sending request!');
    print(e.message);
  }
}

class DioClient {
  final Dio _dio = Dio();

  final String _baseUrl = "http://localhost:3000";

  Future<List<Map<String, dynamic>>> getAllDentals() async {
    List<Map<String, dynamic>> data = [];

    try {
      Response response = await _dio.get("$_baseUrl/dentals");

      // print('Dental Info: ${response.data}');
      for (var dental in response.data) {
        data.add({
          "id": dental['id'],
          "牙技所名稱": dental["牙技所名稱"],
          "牙技所ID": dental["牙技所ID"],
          "牙技所統一編號": dental["牙技所統一編號"],
          "牙技所聯絡人": dental["牙技所聯絡人"],
          "牙技所電話": dental["牙技所電話"],
          "牙技所Email": dental["牙技所Email"],
          "牙技所網址": dental["牙技所網址"],
          "牙技所地區": dental["牙技所地區"],
          "牙技所縣市": dental["牙技所縣市"],
          "牙技所鄉鎮市區": dental["牙技所鄉鎮市區"],
          "牙技所地址": dental["牙技所地址"],
          "牙技所狀態": dental["牙技所狀態"],
          "備註": dental["備註"]
        });
      }
    } on DioException catch (e) {
      handleDioException(e);
    } catch (e) {
      print('Error: $e');
    }
    return data;
  }

  Future<List<Map<String, dynamic>>> getContractsBrief() async {
    List<Map<String, dynamic>> data = [];
    try {
      Response contractResponse = await _dio.get("$_baseUrl/contracts");
      List<dynamic> contracts = contractResponse.data;

      List<String> dentalIds = contracts
          .map((c) => (c["dentalId"] ?? "").toString())
          .toList()
          .toSet()
          .toList();

      Response dentalResponse = await _dio.get(
          "$_baseUrl/dentals?${dentalIds.map((id) => "id=$id").toList().join("&")}");
      List<dynamic> dentals = dentalResponse.data;

      for (var contract in contracts) {
        var matchedDental = dentals.firstWhere(
            (dental) => dental["id"] == contract["dentalId"],
            orElse: () => null);
        data.add({
          "牙技所名稱": matchedDental["牙技所名稱"] ?? "",
          "牙技所統一編號": matchedDental["牙技所統一編號"] ?? "",
          "牙技所狀態": matchedDental["牙技所狀態"] ?? "",
          "合約ID": contract["合約ID"] ?? "",
          "合約編號": contract["合約編號"] ?? "",
          "合約名稱": contract["合約名稱"] ?? "",
          "合約種類": contract["合約種類"] ?? "",
          "合約簽約日": contract["合約簽約日"] ?? "",
          "服務平台細節": contract["服務平台細節"],
          "設備租賃細節": contract["設備租賃細節"],
          "設備買賣細節": contract["設備買賣細節"],
        });
      }
    } on DioException catch (e) {
      handleDioException(e);
    } catch (e) {
      print('Error: $e');
    }
    // print("data: $data");
    return data;
  }

  Future<bool> createDental({required Map<String, String> dentalForm}) async {
    try {
      await _dio.post("$_baseUrl/dentals", data: dentalForm);
    } on DioException catch (e) {
      handleDioException(e);
    } catch (e) {
      print('Error: $e');
    }
    return true;
  }

  Future<bool> createContract(
      {required int selectedDentalID,
      required Map<String, dynamic> contractForm}) async {
    try {
      Map<String, dynamic> newContractForm = {"dentalId": selectedDentalID};

      for (var entry in contractForm.entries) {
        newContractForm.putIfAbsent(entry.key, () => entry.value);
      }

      if (contractForm["合約種類"] == "服務平台合約") {
        newContractForm["設備租賃細節"] = null;
        newContractForm["設備買賣細節"] = null;
      } else if (contractForm["合約種類"] == "設備租賃合約") {
        newContractForm["服務平台細節"] = null;
        newContractForm["設備買賣細節"] = null;
      } else if (contractForm["合約種類"] == "設備買賣合約") {
        newContractForm["服務平台細節"] = null;
        newContractForm["設備租賃細節"] = null;
      }

      await _dio.post("$_baseUrl/contracts", data: newContractForm);
    } on DioException catch (e) {
      handleDioException(e);
    } catch (e) {
      print('Error: $e');
    }
    return true;
  }
}
