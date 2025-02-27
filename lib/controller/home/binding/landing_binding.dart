import 'package:get/get.dart';
import 'package:resume_maker/controller/home/controller/landing_controller.dart';

class LandingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LandingController>(() => LandingController());
  }
}
