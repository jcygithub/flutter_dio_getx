import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../base/BaseController.dart';

/**
 *Created by Jcy
 *on 2022/12/7
 */

///空页面
Widget createEmptyWidget(BaseController controller) {
  return Material(
    child: Center(
        widthFactor: double.infinity,
        child: GestureDetector(
          onTap: () {
            // controller.showLoading();
            controller.initData();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/common_empty_img.png",
                height: 320.w,
                width: 320.w,
              ),
              SizedBox(height: 30.w),
              Text(
                "暂无数据",
                style:
                    TextStyle(fontSize: 32.sp, color: const Color(0xff999999)),
              ),
              SizedBox(height: 20.w),
              Text(
                "点我重试",
                style:
                    TextStyle(fontSize: 25.sp, color: const Color(0xff999999)),
              )
            ],
          ),
        )),
  );
}

///创建AppBar
AppBar createAppBar(
    String titleString, bool showBackButton, List<Widget>? actionWidget,
    {Widget? titleWidget}) {
  return AppBar(
    title: titleWidget ?? titleView(titleString),
    centerTitle: true,
    backgroundColor: const Color(0xffEA4C43),
    iconTheme: const IconThemeData(color: Colors.white),
    elevation: 0,
    systemOverlayStyle: systemOverLayoutStyle(),
    leading: showBackButton ? leadingButton() : null,
    actions: actionWidget,
  );
}

Widget titleView(String titleString) {
  return Text(
    titleString,
    style: TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32.sp),
  );
}
///回退按钮
Widget leadingButton() {
  return IconButton(
    icon: const Icon(Icons.arrow_back_ios),
    onPressed: () async {
      // onBackPressed();
      var canPop = navigator?.canPop();
      if (canPop != null && canPop) {
        Get.back();
      } else {
        SystemNavigator.pop();
      }
    },
  );
}

Future<void> pop() async {
  await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
}

///状态栏颜色设置
SystemUiOverlayStyle systemOverLayoutStyle() {
  return const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Color(0xffEA4C43),
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light);
}

///异常布局
Widget createErrWidget(BaseController controller, String? error) {
  return Material(
      child: Center(
          widthFactor: double.infinity,
          child: GestureDetector(
            onTap: () {
              // controller.showLoading();
              controller.initData();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/common_empty_img.png",
                  height: 320.w,
                  width: 320.w,
                ),
                SizedBox(height: 30.w),
                Text(
                  error ?? "页面加载异常",
                  style: TextStyle(
                      fontSize: 32.sp, color: const Color(0xff999999)),
                ),
                SizedBox(height: 20.w),
                Text(
                  "点我重试",
                  style: TextStyle(
                      fontSize: 25.sp, color: const Color(0xff999999)),
                )
              ],
            ),
          )));
}