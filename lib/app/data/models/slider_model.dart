// To parse this JSON data, do
//
//     final sliderApps = sliderAppsFromJson(jsonString);

import 'dart:convert';

SliderApps sliderAppsFromJson(String str) =>
    SliderApps.fromJson(json.decode(str));

String sliderAppsToJson(SliderApps data) => json.encode(data.toJson());

class SliderApps {
  String? masterSliderId;
  String? masterSliderTitle;
  String? masterSliderImg;
  String? masterSliderPublishDate;
  String? customerMembershipId;

  SliderApps({
    this.masterSliderId,
    this.masterSliderTitle,
    this.masterSliderImg,
    this.masterSliderPublishDate,
    this.customerMembershipId,
  });

  factory SliderApps.fromJson(Map<String, dynamic> json) => SliderApps(
        masterSliderId: json["master_slider_id"],
        masterSliderTitle: json["master_slider_title"],
        masterSliderImg: json["master_slider_img"],
        masterSliderPublishDate: json["master_slider_publish_date"],
        customerMembershipId: json["customer_membership_id"],
      );

  Map<String, dynamic> toJson() => {
        "master_slider_id": masterSliderId,
        "master_slider_title": masterSliderTitle,
        "master_slider_img": masterSliderImg,
        "master_slider_publish_date": masterSliderPublishDate,
        "customer_membership_id": customerMembershipId,
      };
}
