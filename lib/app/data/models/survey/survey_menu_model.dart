// To parse this JSON data, do
//
//     final surveyMenu = surveyMenuFromJson(jsonString);

import 'dart:convert';

SurveyMenu surveyMenuFromJson(String str) =>
    SurveyMenu.fromJson(json.decode(str));

String surveyMenuToJson(SurveyMenu data) => json.encode(data.toJson());

class SurveyMenu {
  String? masterSurveyId;
  String? masterSurveyTitle;
  String? masterSurveyPoint;
  DateTime? masterSurveyDateCreate;
  dynamic employeeId;

  SurveyMenu({
    this.masterSurveyId,
    this.masterSurveyTitle,
    this.masterSurveyPoint,
    this.masterSurveyDateCreate,
    this.employeeId,
  });

  factory SurveyMenu.fromJson(Map<String, dynamic> json) => SurveyMenu(
        masterSurveyId: json["master_survey_id"],
        masterSurveyTitle: json["master_survey_title"],
        masterSurveyPoint: json["master_survey_point"],
        masterSurveyDateCreate: json["master_survey_date_create"] == null
            ? null
            : DateTime.parse(json["master_survey_date_create"]),
        employeeId: json["employee_id"],
      );

  Map<String, dynamic> toJson() => {
        "master_survey_id": masterSurveyId,
        "master_survey_title": masterSurveyTitle,
        "master_survey_point": masterSurveyPoint,
        "master_survey_date_create": masterSurveyDateCreate?.toIso8601String(),
        "employee_id": employeeId,
      };
}
