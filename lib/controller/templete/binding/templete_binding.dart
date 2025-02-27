import 'package:get/get.dart';
import 'package:resume_maker/controller/templete/controller/templete_controller.dart';

class TempleteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TempleteController>(() => TempleteController());
  }
}
