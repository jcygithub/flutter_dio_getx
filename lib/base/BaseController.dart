import 'package:base_flutter_master/base/base_response_entity.dart';
import 'package:base_flutter_master/utils/LogUtils.dart';
import 'package:base_flutter_master/widget/ToastMixin.dart';
import 'package:common_utils/common_utils.dart';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../http/AppException.dart';
import '../http/ResponseUtil.dart';

/**
 *Created by Jcy
 *on 2022/12/6
 * 逻辑调用
 */
abstract class BaseController extends GetxController with StateMixin ,ToastMixin{
  /// 网络请求参数
  Map<String, dynamic> params = {};

  /// Post网络请求统一封装
  postMethod<T>(Function callback) async{
    /// 网络封装，这里就不展示了每个公司的封装不一样
    ConnectivityResult connectivityResult =
    await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      showError(errorMessage: '请求网络异常，请稍后重试！');
      return;
    }
    ResponseUtil.instance.post("url",params).then((response){
      ///1.BaseResponse解析
      if (response.statusCode==200) {
        BaseResponseEntity<T> baseResponseEntity = BaseResponseEntity<T>.fromJson(response.data);
          if (baseResponseEntity.code == 200) {
            ///3.返回实体类 如果data为空 调用的control调用showEmpty()
            callback(response.data);
            showSuccess();
          } else {
            ///2.错误展示
            showError(errorMessage: baseResponseEntity.message);
          }
      } else {
        ///2.错误展示
        showError(errorMessage: response.statusMessage);
      }

    });
  }
  /// get
  getMethod(Function callback) {
    /// 网络封装，这里就不展示了每个公司的封装不一样
    ResponseUtil.instance.get("url",params).then((response){
      callback(response);
    });
  }
  /// del
  delMethod(Function callback) {
    /// 网络封装，这里就不展示了每个公司的封装不一样
  }
  /// Put网络请求统一封装
  putMethod(Function callback) {
    /// 网络封装，这里就不展示了每个公司的封装不一样
  }

  ///初始化数据
  initData();
  @override
  void onInit() {
    // TODO: implement onInit
    ///对Controller初始化
    LogD('>>>>>>>>>>>>>>>>>>> onInit');
    super.onInit();
  }
  @override
  void onReady() {
    // TODO: implement onReady
    ///处理异步，如网络请求
    LogD('>>>>>>>>>>>>>>>>>>>> onReady');
    initData();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    ///关闭对象 动画 释放内存 数据持久化
    LogD('>>>>>>>>>>>>>>> onClose');

    super.onClose();
  }
  @override
  void onResumed() {
    ///重新进入页面执行
    // TODO: implement onResumed
    LogD('>>>>>>>>>>>> onResumed');
  }

  void showSuccess() {
    change(null, status: RxStatus.success());
  }

  void showEmpty() {
    change(null, status: RxStatus.empty());
  }

  void showError({String? errorMessage, Exception? e}) {
    if (e != null) {
      if (e is DioError && e.error is AppException) {
        var error = e.error as AppException;
        change(null, status: RxStatus.error(error.message));
      } else {
        change(null, status: RxStatus.error(errorMessage));
      }
    } else {
      change(null, status: RxStatus.error(errorMessage));
    }
  }

  void showLoading() {
    change(null, status: RxStatus.loading());
  }
}