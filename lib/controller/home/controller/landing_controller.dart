import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:resume_maker/res/str_res.dart';
import 'package:resume_maker/widget/alert/alert_snack_bar.dart';

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

  static Future<void> _requestPermission() async {
    PermissionStatus result = PermissionStatus.denied;
    if (GetPlatform.isIOS) {
      result = await Permission.storage.request();
    } else if (GetPlatform.isAndroid) {
      result = await Permission.photos.request();
    }

    if (result.isDenied || result.isPermanentlyDenied) {
      alertSnackbar(
        message: StrRes.ourNeedToAccessYourPhotoToUploadResume,
      );
    }
  }
}
