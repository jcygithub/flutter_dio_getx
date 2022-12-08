
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../page/login/binding.dart';
import '../page/login/login.dart';
import '../page/main/binding.dart';
import '../page/main/mian.dart';

/**
 *Created by Jcy
 *on 2022/12/7
 */
abstract class AppRoutes {
  /// 登录页
  static const login = "/login";

  /// 入口
  static const mainPage = "/mainPage";

  static final routerPages = [
    ///主入口
    GetPage(
        name: mainPage,
        page: () =>  MainPage(),
        binding: MainBinding()),
    GetPage(
      name: login,
      page: () => const LoginPage(),
      binding: LoginBinding()
    ),
  ];
}
