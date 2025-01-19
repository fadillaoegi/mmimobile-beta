// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? provinceId;
  String? cityId;
  String? subdistrictId;
  String? customerTypeId;
  String? customerId;
  String? customerDateBirth;
  String? customerName;
  String? customerPhone;
  String? customerEmail;
  String? customerAddress;

  User({
    this.provinceId,
    this.cityId,
    this.subdistrictId,
    this.customerTypeId,
    this.customerId,
    this.customerDateBirth,
    this.customerName,
    this.customerPhone,
    this.customerEmail,
    this.customerAddress,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        provinceId: json["province_id"],
        cityId: json["city_id"],
        subdistrictId: json["subdistrict_id"],
        customerTypeId: json["customer_type_id"] == 1 ? "Pelanggan" : "Calon Pelanggan",
        customerId: json["customer_id"],
        customerDateBirth: json["customer_date_birth"],
        customerName: json["customer_name"],
        customerPhone: json["customer_phone"],
        customerEmail: json["customer_email"],
        customerAddress: json["customer_address"],
      );

  Map<String, dynamic> toJson() => {
        "province_id": provinceId,
        "city_id": cityId,
        "subdistrict_id": subdistrictId,
        "customer_type_id": customerTypeId,
        "customer_id": customerId,
        "customer_date_birth": customerDateBirth,
        "customer_name": customerName,
        "customer_phone": customerPhone,
        "customer_email": customerEmail,
        "customer_address": customerAddress,
      };
}
