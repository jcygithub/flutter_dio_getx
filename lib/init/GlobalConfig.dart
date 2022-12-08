import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sp_util/sp_util.dart';

/**
 *Created by Jcy
 *on 2022/12/7
 */
class GlobalConfig {
  /// 初始化
  static init() async {
    /// 初始化生命周期 监听
    WidgetsFlutterBinding.ensureInitialized();
    await initthirdparty();
  }

  /// 初始化第三方库
  static initthirdparty() async {
    /// 初始化本地数据库
    await SpUtil.getInstance();

    /// 配置通用 loading 时长
    EasyLoading.instance.displayDuration = const Duration(
      milliseconds: 1500,
    );
  }

  /// 初始化默认数据
  // static initnormaldata() async {
  //   if (UtilsTool.userislogin()) {
  //     UserModel model = UserModel.fromMap(CommonSpUtil.getUserInfo()!);
  //     UserStateController.current.loadSuccess(model);
  //   }
  // }
}