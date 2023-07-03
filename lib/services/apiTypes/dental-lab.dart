// To parse this JSON data, do
//
//     final dentalLab = dentalLabFromJson(jsonString);

import 'dart:convert';

DentalLab dentalLabFromJson(String str) => DentalLab.fromJson(json.decode(str));

String dentalLabToJson(DentalLab data) => json.encode(data.toJson());

class DentalLab {
  int totalCount;
  int totalPage;
  int pageNo;
  int pageSize;
  List<DentalResult> result;

  DentalLab({
    required this.totalCount,
    required this.totalPage,
    required this.pageNo,
    required this.pageSize,
    required this.result,
  });

  factory DentalLab.fromJson(Map<String, dynamic> json) => DentalLab(
        totalCount: json["totalCount"],
        totalPage: json["totalPage"],
        pageNo: json["pageNo"],
        pageSize: json["pageSize"],
        result: List<DentalResult>.from(
            json["DentalResult"].map((x) => DentalResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalCount": totalCount,
        "totalPage": totalPage,
        "pageNo": pageNo,
        "pageSize": pageSize,
        "DentalResult": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class DentalResult {
  String id;
  String name;
  String status;
  String address;
  String phoneNumber;
  String contactPerson;
  String email;
  String uniformNo;
  DateTime createdTime;
  DateTime modifiedTime;
  String remark;

  DentalResult({
    required this.id,
    required this.name,
    required this.status,
    required this.address,
    required this.phoneNumber,
    required this.contactPerson,
    required this.email,
    required this.uniformNo,
    required this.createdTime,
    required this.modifiedTime,
    required this.remark,
  });

  factory DentalResult.fromJson(Map<String, dynamic> json) => DentalResult(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        address: json["address"],
        phoneNumber: json["phoneNumber"],
        contactPerson: json["contactPerson"],
        email: json["email"],
        uniformNo: json["uniformNo"],
        createdTime: DateTime.parse(json["createdTime"]),
        modifiedTime: DateTime.parse(json["modifiedTime"]),
        remark: json["remark"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "address": address,
        "phoneNumber": phoneNumber,
        "contactPerson": contactPerson,
        "email": email,
        "uniformNo": uniformNo,
        "createdTime": createdTime.toIso8601String(),
        "modifiedTime": modifiedTime.toIso8601String(),
        "remark": remark,
      };
}
