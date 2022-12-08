import 'package:base_flutter_master/page/login/binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import '../route/AppRoutes.dart';
import '../utils/CommentTools.dart';
import '../utils/CommonSpUtil.dart';

/**
 *Created by Jcy
 *on 2022/12/7
 */
class Application extends StatelessWidget {
  Application({Key? key}) : super(key: key);
  final easyLoading = EasyLoading.init();
  @override
  Widget build(BuildContext context) {
    String rootRoutes = CommonSpUtil.configRootPageName();
    List<String> launch = CommonSpUtil.configLaunch();
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (content,child ) {
        return GestureDetector(
          /// 全局点击  事件
          onTap: () => CommentTools.hideKeyboard(context),
          /// 通过GetX 创建根视图
          child: GetMaterialApp(
            // /// 入口路由
            initialRoute: rootRoutes,
            /// 所有路由集合
            getPages: AppRoutes.routerPages,
            // defaultTransition: Transition.fade,
            /// 是否显示 导航栏右上角 debug 标识
            debugShowCheckedModeBanner: false,
            builder: (context, widget) => MediaQuery(
              //设置文字大小不随系统设置改变
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: easyLoading(context, widget),
            ),
            theme: ThemeData(brightness: Brightness.light),
            darkTheme: ThemeData(brightness: Brightness.dark),
            /// 配置 本地存储 主题类型
            // themeMode: ThemeTool.getlocalprofileaboutThemeModel(),
            /// 国际化配置 代理
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate, // ios
            ],
            // translations: LanguageInfoConfig(),
            /// 配置语言
            locale: Locale(launch[0], launch[1]),
            fallbackLocale: const Locale("zh", "CN"), //
            initialBinding: LoginBinding(),
            // home: MainPage(),
            /// 本地支持语言
            supportedLocales: const [
              Locale('zh', 'CN'),
              Locale('en', 'US'),
            ],
          ),
        );
      },
    );
  }
}