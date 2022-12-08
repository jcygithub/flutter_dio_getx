import 'package:get/get.dart';

import 'logic.dart';

class ServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ServiceLogic());
  }
}
