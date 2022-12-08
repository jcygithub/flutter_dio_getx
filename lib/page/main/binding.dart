import 'package:base_flutter_master/page/home/logic.dart';
import 'package:base_flutter_master/page/service/logic.dart';
import 'package:get/get.dart';

import '../find/logic.dart';
import '../mine/logic.dart';
import 'logic.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainLogic());
    Get.lazyPut(() => HomeLogic());
    Get.lazyPut(() => ServiceLogic());
    Get.lazyPut(() => FindLogic());
    Get.lazyPut(() => MineLogic());
  }
}
