// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? customerId;
  bool? customerStatus;
  bool? customerPassDefault;
  String? customerName;
  String? customerDateBirth;
  String? customerEmail;
  String? customerPassword;
  String? customerPhone;
  int? provinceId;
  int? cityId;
  int? subdistrictId;

  User({
    this.customerId,
    this.customerStatus,
    this.customerPassDefault,
    this.customerName,
    this.customerDateBirth,
    this.customerEmail,
    this.customerPassword,
    this.customerPhone,
    this.provinceId,
    this.cityId,
    this.subdistrictId,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        customerId: json["customer_id"],
        customerStatus: json["customer_status"],
        customerPassDefault: json["customer_pass_default"],
        customerName: json["customer_name"],
        customerDateBirth: json["customer_date_birth"],
        customerEmail: json["customer_email"],
        customerPassword: json["customer_password"],
        customerPhone: json["customer_phone"],
        provinceId: json["province_id"],
        cityId: json["city_id"],
        subdistrictId: json["subdistrict_id"],
      );

  Map<String, dynamic> toJson() => {
        "customer_id": customerId,
        "customer_status": customerStatus,
        "customer_pass_default": customerPassDefault,
        "customer_name": customerName,
        "customer_date_birth": customerDateBirth,
        "customer_email": customerEmail,
        "customer_password": customerPassword,
        "customer_phone": customerPhone,
        "province_id": provinceId.toString(),
        "city_id": cityId.toString(),
        "subdistrict_id": subdistrictId.toString(),
      };
}
