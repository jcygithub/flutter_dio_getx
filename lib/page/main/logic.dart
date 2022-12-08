import 'package:base_flutter_master/base/BaseController.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../find/find.dart';
import '../home/home.dart';
import '../mine/mine.dart';
import '../service/service.dart';

class MainLogic extends BaseController {
  DateTime? lastPopTime;
  final RxInt curPage = 0.obs;
  final PageController pageController = PageController(initialPage: 0);
  final List<Widget> children = [
   const HomePage(),
   const ServicePage(),
   const FindPage(),
   const MinePage()
  ];
  @override
  initData() {
    showSuccess();
  }

}
