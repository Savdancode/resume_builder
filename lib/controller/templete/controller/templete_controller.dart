import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:resume_maker/model/templete/templete_data_model.dart';

class TempleteController extends GetxController {
  final pdf = pw.Document();
  final ImagePicker picker = ImagePicker();
  var image = Rx<XFile?>(null);
  final txtFirstName = TextEditingController();
  final txtLastName = TextEditingController();
  final txtPosition = TextEditingController();
  late TempleteDataModel resumeDetails;

  generateData() async {
    resumeDetails = TempleteDataModel(
      firstName: txtFirstName.text,
      lastName: txtLastName.text,
      position: txtPosition.text,
      profileImagePath: image.value!.path,
    );
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image.value = pickedFile;
    }
  }
}
