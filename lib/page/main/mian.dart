import 'package:base_flutter_master/base/BaseStatefulWidget.dart';
import 'package:base_flutter_master/widget/KeepAliveWrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'logic.dart';

class MainPage extends BaseStatefulWidget<MainLogic> {
  MainPage({Key? key}) : super(key: key);

  @override
  bool showTitleBar()=>false;
  @override
  Widget buildContent(BuildContext context) {
    // TODO: implement buildContent
    return Obx(() => WillPopScope(
        child: Scaffold(
          body: KeepAliveWrapper(child: PageView(
            controller: controller.pageController,
            onPageChanged: (index) {
              controller.curPage.value = index;
            },
            children: controller.children,
          )),
            bottomNavigationBar: BottomNavigationBar(
              elevation: 8.0,
              type: BottomNavigationBarType.fixed,
              currentIndex: controller.curPage.value,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
                BottomNavigationBarItem(icon: Icon(Icons.explore), label: "发现"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.local_fire_department), label: "热门"),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: "我的"),
              ],
              fixedColor: const Color(0xffEA4C43),
              onTap: (int index) {
                //跳转到指定页面
                controller.pageController.jumpToPage(index);
                controller.curPage.value = index;
              },
            )
        ),
        onWillPop: () async {
          if (controller.lastPopTime == null ||
              DateTime.now().difference(controller.lastPopTime!) >
                  const Duration(seconds: 2)) {
            // 存储当前按下back键的时间
            controller.lastPopTime = DateTime.now();
            // toast
            showToast("再按一次退出app");
            return false;
          } else {
            controller.lastPopTime = DateTime.now();
            // 退出app
            await SystemNavigator.pop();
            return true;
          }
        }));
  }
}
