// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? id;
  String? customerName;
  String? customerEmail;
  String? customerPassword;
  String? customerPhone;
  int? provinceId;
  int? cityId;
  int? subdistrictId;

  User({
    this.id,
    this.customerName,
    this.customerEmail,
    this.customerPassword,
    this.customerPhone,
    this.provinceId,
    this.cityId,
    this.subdistrictId,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        customerName: json["customer_name"],
        customerEmail: json["customer_email"],
        customerPassword: json["customer_password"],
        customerPhone: json["customer_phone"],
        provinceId: json["province_id"],
        cityId: json["city_id"],
        subdistrictId: json["subdistrict_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_name": customerName,
        "customer_email": customerEmail,
        "customer_password": customerPassword,
        "customer_phone": customerPhone,
        "province_id": provinceId,
        "city_id": cityId,
        "subdistrict_id": subdistrictId,
      };
}
