import 'dart:convert';

import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:resume_maker/util/log.dart';

class TranslationService extends Translations {
  static Map<String, Map<String, String>> translations = {};

  static Future<void> loadTranslations() async {
    try {
      String enJson = await rootBundle.loadString('assets/lang/en_US.json');
      String esJson = await rootBundle.loadString('assets/lang/km_KH.json');
      translations['en_US'] = Map<String, String>.from(json.decode(enJson));
      translations['km_KH'] = Map<String, String>.from(json.decode(esJson));
    } catch (e) {
      debugPrint('Error loading translations: $e');
    }
  }

  @override
  Map<String, Map<String, String>> get keys => translations;
}
