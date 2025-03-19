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
  String? customerMembershipBenefit;

  MembershipDataId({
    this.customerMembershipId,
    this.customerMembershipName,
    this.customerMembershipBenefit,
  });

  factory MembershipDataId.fromJson(Map<String, dynamic> json) =>
      MembershipDataId(
        customerMembershipId: json["customer_membership_id"],
        customerMembershipName: json["customer_membership_name"],
        customerMembershipBenefit: json["customer_membership_benefit"],
      );

  Map<String, dynamic> toJson() => {
        "customer_membership_id": customerMembershipId,
        "customer_membership_name": customerMembershipName,
        "customer_membership_benefit": customerMembershipBenefit,
      };
}
