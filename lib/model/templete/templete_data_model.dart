import 'package:flutter/material.dart';

class TempleteDataModel {
  String firstName = "",
      lastName = "",
      position = "",
      aboutMeDes = "",
      tellPhone = "",
      email = "",
      address = "",
      website = "";
  List<SkillModel> listSkills = [];
  List<EducationModel> listEducation = [];
  TempleteDataModel(
      {required this.firstName,
      required this.lastName,
      required this.position});
}

class SkillModel {
  int? id;
  String title = "";
  Icon? icon;
  SkillModel({this.id = 0, required this.title, this.icon});
}

class EducationModel {
  String schoolNanme = "";
  String major = "";
  String peroid = "";
  EducationModel(
      {required this.major, required this.peroid, required this.schoolNanme});
}

class ExperienceModel {
  String companyName = "", position = "";
  String peroid = "";
  List<SkillModel> listExperience = [];
}
