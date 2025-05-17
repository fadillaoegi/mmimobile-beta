// To parse this JSON data, do
//
//     final membershipDataBenefit = membershipDataBenefitFromJson(jsonString);

import 'dart:convert';

MembershipDataBenefit membershipDataBenefitFromJson(String str) =>
    MembershipDataBenefit.fromJson(json.decode(str));

String membershipDataBenefitToJson(MembershipDataBenefit data) =>
    json.encode(data.toJson());

class MembershipDataBenefit {
  String? customerMembershipId;
  String? customerMembershipName;
  String? customerMembershipBenefit;
  String? customerMembershipFile;

  MembershipDataBenefit({
    this.customerMembershipId,
    this.customerMembershipName,
    this.customerMembershipBenefit,
    this.customerMembershipFile,
  });

  factory MembershipDataBenefit.fromJson(Map<String, dynamic> json) =>
      MembershipDataBenefit(
        customerMembershipId: json["customer_membership_id"],
        customerMembershipName: json["customer_membership_name"],
        customerMembershipBenefit: json["customer_membership_benefit"],
        customerMembershipFile: json["customer_membership_file"],
      );

  Map<String, dynamic> toJson() => {
        "customer_membership_id": customerMembershipId,
        "customer_membership_name": customerMembershipName,
        "customer_membership_benefit": customerMembershipBenefit,
        "customer_membership_file": customerMembershipFile,
      };
}
