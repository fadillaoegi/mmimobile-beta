// To parse this JSON data, do
//
//     final membershipData = membershipDataFromJson(jsonString);

import 'dart:convert';

MembershipData membershipDataFromJson(String str) =>
    MembershipData.fromJson(json.decode(str));

String membershipDataToJson(MembershipData data) => json.encode(data.toJson());

class MembershipData {
  String? customerMembershipId;
  String? customerMembershipName;
  String? customerMembershipMin;
  String? customerMembershipMax;
  String? customerMembershipColor;
  String? customerMembershipColorSecond;
  String? customerMembershipStatus;

  MembershipData({
    this.customerMembershipId,
    this.customerMembershipName,
    this.customerMembershipMin,
    this.customerMembershipMax,
    this.customerMembershipColor,
    this.customerMembershipColorSecond,
    this.customerMembershipStatus,
  });

  factory MembershipData.fromJson(Map<String, dynamic> json) => MembershipData(
        customerMembershipId: json["customer_membership_id"],
        customerMembershipName: json["customer_membership_name"],
        customerMembershipMin: json["customer_membership_min"],
        customerMembershipMax: json["customer_membership_max"],
        customerMembershipColor: json["customer_membership_color"],
        customerMembershipColorSecond: json["customer_membership_color_second"],
        customerMembershipStatus: json["customer_membership_status"],
      );

  Map<String, dynamic> toJson() => {
        "customer_membership_id": customerMembershipId,
        "customer_membership_name": customerMembershipName,
        "customer_membership_min": customerMembershipMin,
        "customer_membership_max": customerMembershipMax,
        "customer_membership_color": customerMembershipColor,
        "customer_membership_color_second": customerMembershipColorSecond,
        "customer_membership_status": customerMembershipStatus,
      };
}
