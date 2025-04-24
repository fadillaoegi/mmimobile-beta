import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  bool? customerStatus;
  String? provinceId;
  String? cityId;
  String? subdistrictId;
  String? customerId;
  String? customerTypeId;
  String? customerDateBirth;
  String? customerName;
  String? customerPhone;
  String? customerEmail;
  String? customerAddress;
  String? membershipId;
  String? customerMembershipName;
  String? customerAddressRecipient;
  String? customerPhotoProfil;

  User({
    this.customerStatus,
    this.provinceId,
    this.cityId,
    this.subdistrictId,
    this.customerId,
    this.customerTypeId,
    this.customerDateBirth,
    this.customerName,
    this.customerPhone,
    this.customerEmail,
    this.customerAddress,
    this.membershipId,
    this.customerMembershipName,
    this.customerAddressRecipient,
    this.customerPhotoProfil,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        customerStatus: json["customer_status"],
        provinceId: json["province_id"],
        cityId: json["city_id"],
        subdistrictId: json["subdistrict_id"],
        customerId: json["customer_id"],
        customerTypeId: json["customer_type_id"],
        customerDateBirth: json["customer_date_birth"],
        customerName: json["customer_name"],
        customerPhone: json["customer_phone"],
        customerEmail: json["customer_email"],
        customerAddress: json["customer_address"],
        membershipId: json["membership_id"],
        customerMembershipName: json["customer_membership_name"],
        customerAddressRecipient: json["customer_address_recipient"],
        customerPhotoProfil: json["customer_photo_profil"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "customer_status": customerStatus,
        "province_id": provinceId,
        "city_id": cityId,
        "subdistrict_id": subdistrictId,
        "customer_id": customerId,
        "customer_type_id": customerTypeId,
        "customer_date_birth": customerDateBirth,
        "customer_name": customerName,
        "customer_phone": customerPhone,
        "customer_email": customerEmail,
        "customer_address": customerAddress,
        "membership_id": membershipId,
        "customer_membership_name": customerMembershipName,
        "customer_address_recipient": customerAddressRecipient,
        "customer_photo_profil": customerPhotoProfil,
      };
}
