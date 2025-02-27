import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class LandingController extends GetxController {
  @override
  void onInit() {
    _requestPermission();
    super.onInit();
  }

  final _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;

  void changeIndex(int index) {
    _currentIndex.value = index;
    switch (index) {
      case 0:
        Get.rootDelegate
            .toNamed('/landing/home'); // Navigate inside the nested route
        break;
      case 1:
        Get.rootDelegate.toNamed('/landing/profile');
        break;
      case 2:
        Get.rootDelegate.toNamed('/landing/settings');
        break;
    }
  }

  static Future<bool> _requestPermission() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      return true;
    } else {
      print("Storage permission denied.");
      return false;
    }
  }
}
