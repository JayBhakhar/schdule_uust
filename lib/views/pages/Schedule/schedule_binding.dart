import 'package:get/get.dart';

import 'schedule_controller.dart';

class ScheduleBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScheduleController());
  }
}