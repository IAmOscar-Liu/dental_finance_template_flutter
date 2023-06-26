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

  Future<List<dynamic>?> getAllDentals() async {
    List<dynamic>? data;

    try {
      Response response = await _dio.get("$_baseUrl/dentals");

      // print('Dental Info: ${response.data}');
      data = response.data;
    } on DioException catch (e) {
      handleDioException(e);
    } catch (e) {
      print('Error: $e');
    }
    return data;
  }

  Future<List<Map<String, String>>> getContractsBrief() async {
    List<Map<String, String>> data = [];
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
          "合約ID": contract["合約ID"] ?? "",
          "合約編號": contract["合約編號"] ?? "",
          "合約名稱": contract["合約名稱"] ?? "",
          "牙技所ID": matchedDental["牙技所ID"] ?? "",
          "牙技所名稱": matchedDental["牙技所名稱"] ?? "",
          "合約種類": contract["合約種類"] ?? "",
          "牙技所狀態": matchedDental["牙技所狀態"] ?? "",
          "合約起始日": contract["合約起始日"] ?? "",
          "合約到期日": contract["合約到期日"] ?? "",
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

  Future<bool> createDentalAndContract(
      {required Map<String, String> dentalForm,
      required Map<String, String> contractForm}) async {
    try {
      Response dentalResponse =
          await _dio.post("$_baseUrl/dentals", data: dentalForm);

      // print('dental Response: ${dentalResponse.data}');
      dynamic data = dentalResponse.data;
      // print('dental ID: ${data['id']},  type: ${data['id'].runtimeType}');

      Map<String, dynamic> newContractForm = {"dentalId": data['id']};
      for (var entry in contractForm.entries) {
        newContractForm.putIfAbsent(entry.key, () => entry.value);
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
