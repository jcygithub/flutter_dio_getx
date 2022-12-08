
import 'package:sp_util/sp_util.dart';
import '../route/AppRoutes.dart';
import 'FlagConfigUtils.dart';

/**
 *Created by Jcy
 *on 2022/12/7
 */
class CommonSpUtil {
  /// 获取token
  static String? getUserToken() {
    return SpUtil.getString(
      FlagConfigUtils.usertoken,
    );
  }

  /// 存token
  static saveUserToken({required String token}) {
    return SpUtil.putString(
      FlagConfigUtils.usertoken,
      token,
    );
  }

  /// 存用户信息
  static saveUserInfo({required Map info}) {
    return SpUtil.putObject(FlagConfigUtils.userinfo, info);
  }

  /// 取用户信息
  static Map? getUserInfo() {
    return SpUtil.getObject(FlagConfigUtils.userinfo);
  }

  /// 更新app 安装状态
  static savefirstinstal({required int instal}) {
    return SpUtil.putInt(
      FlagConfigUtils.firstinstal,
      instal,
    );
  }

  /// 获取 app 次数
  static int getFirstInstall() {
    return SpUtil.getInt(FlagConfigUtils.firstinstal) ?? 0;
  }

  /// 深色模式 0: 关闭 1: 开启 2: 随系统
  static int getThemeType() {
    return SpUtil.getInt(FlagConfigUtils.themeType) ?? 0;
  }

  /// 存深色模式
  static saveThemeType({required int type}) {
    return SpUtil.putInt(FlagConfigUtils.themeType, type);
  }

  /// 存语言配置
  static saveLaunchType({required String launch}) {
    return SpUtil.putString(FlagConfigUtils.launchType, launch);
  }

  /// 获取语言配置
  static String getLaunchType() {
    return SpUtil.getString(FlagConfigUtils.launchType) ?? "zh_CN";
  }
  // 获取配置语言
  static List<String> configLaunch() {
    List<String> list = ["zh", 'CN'];
    String launch = getLaunchType();
    List<String> lochList = launch.split('_');
    if (lochList.length == 2) {
      list = lochList;
    }
    return list;
  }
  /// 判断用户是否登录
  static userislogin() {
    bool islogin = true;
    String? token = CommonSpUtil.getUserToken();
    if (token == null || token == "") {
      islogin = false;
    }
    return islogin;
  }

  /// 配置入口
  static configRootPageName() {
    String rootRoute = AppRoutes.mainPage;
    int install = getFirstInstall();
    if (install == 0 && !userislogin()) {
      rootRoute = AppRoutes.login;
    } else if (!userislogin()) {
      rootRoute = AppRoutes.login;
    }
    return rootRoute;
  }
}