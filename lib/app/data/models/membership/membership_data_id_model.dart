// To parse this JSON data, do
//
//     final membershipDataId = membershipDataIdFromJson(jsonString);

import 'dart:convert';

MembershipDataId membershipDataIdFromJson(String str) =>
    MembershipDataId.fromJson(json.decode(str));

String membershipDataIdToJson(MembershipDataId data) =>
    json.encode(data.toJson());

class MembershipDataId {
  String? customerMembershipId;
  String? customerMembershipName;
  String? customerMembershipMin;
  String? customerMembershipMax;
  String? customerMembershipColor;
  String? customerMembershipColorSecond;
  String? customerMembershipStatus;
  // String? customerMembershipBenefit;

  MembershipDataId({
    this.customerMembershipId,
    this.customerMembershipName,
    this.customerMembershipMin,
    this.customerMembershipMax,
    this.customerMembershipColor,
    this.customerMembershipColorSecond,
    this.customerMembershipStatus,
    // this.customerMembershipBenefit,
  });

  factory MembershipDataId.fromJson(Map<String, dynamic> json) =>
      MembershipDataId(
        customerMembershipId: json["customer_membership_id"],
        customerMembershipName: json["customer_membership_name"],
        customerMembershipMin: json["customer_membership_min"],
        customerMembershipMax: json["customer_membership_max"],
        customerMembershipColor: json["customer_membership_color"],
        customerMembershipColorSecond: json["customer_membership_color_second"],
        customerMembershipStatus: json["customer_membership_status"],
        // customerMembershipBenefit: json["customer_membership_benefit"],
      );

  Map<String, dynamic> toJson() => {
        "customer_membership_id": customerMembershipId,
        "customer_membership_name": customerMembershipName,
        "customer_membership_min": customerMembershipMin,
        "customer_membership_max": customerMembershipMax,
        "customer_membership_color": customerMembershipColor,
        "customer_membership_color_second": customerMembershipColorSecond,
        "customer_membership_status": customerMembershipStatus,
        // "customer_membership_benefit": customerMembershipBenefit,
      };
}
