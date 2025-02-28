import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:resume_maker/model/templete/templete_data_model.dart';

class TempleteController extends GetxController {
  final pdf = pw.Document();
  final txtFirstName = TextEditingController();
  final txtLastName = TextEditingController();
  final txtPosition = TextEditingController();
  late TempleteDataModel resumeDetails;

  @override
  void onClose() {
    txtFirstName.dispose();
    txtLastName.dispose();
    super.onClose();
  }

  generateData() async {
    resumeDetails = TempleteDataModel(
      firstName: txtFirstName.text,
      lastName: txtLastName.text,
      position: txtPosition.text,
    );
  }
}
