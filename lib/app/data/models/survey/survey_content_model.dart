// To parse this JSON data, do
//
//     final surveyContent = surveyContentFromJson(jsonString);

import 'dart:convert';

SurveyContent surveyContentFromJson(String str) =>
    SurveyContent.fromJson(json.decode(str));

String surveyContentToJson(SurveyContent data) => json.encode(data.toJson());

class SurveyContent {
  String? masterSurveyDetailId;
  String? masterSurveyDetailAssessment;
  String? masterSurveyDetailAssessmentType;
  String? masterSurveyId;

  SurveyContent({
    this.masterSurveyDetailId,
    this.masterSurveyDetailAssessment,
    this.masterSurveyDetailAssessmentType,
    this.masterSurveyId,
  });

  factory SurveyContent.fromJson(Map<String, dynamic> json) => SurveyContent(
        masterSurveyDetailId: json["master_survey_detail_id"],
        masterSurveyDetailAssessment: json["master_survey_detail_assessment"],
        masterSurveyDetailAssessmentType:
            json["master_survey_detail_assessment_type"],
        masterSurveyId: json["master_survey_id"],
      );

  Map<String, dynamic> toJson() => {
        "master_survey_detail_id": masterSurveyDetailId,
        "master_survey_detail_assessment": masterSurveyDetailAssessment,
        "master_survey_detail_assessment_type":
            masterSurveyDetailAssessmentType,
        "master_survey_id": masterSurveyId,
      };
}
