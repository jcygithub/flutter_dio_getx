import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/get_instance.dart';

import '../widget/LoadStateWidget.dart';
import '../widget/ToastMixin.dart';
import 'BaseController.dart';

/**
 *Created by Jcy
 *on 2022/12/6
 */
abstract class BaseStatefulWidget<T extends BaseController>
    extends StatefulWidget with ToastMixin {
  final String? tag = null;
  ///Get 局部更新字段
  get updateId => null;
  const BaseStatefulWidget({Key? key}) : super(key: key);

  T get controller {
    return GetInstance().find<T>(tag: tag);
  }

  ///是否展示titleBar标题栏
  bool showTitleBar() => true;

  ///侧边栏
  bool showDrawer() => false;

  ///页面标题设置
  String titleString() => "标题";

  ///标题栏title的Widget
  Widget? titleWidget(){}

  ///是否展示回退按钮
  bool showBackButton() => true;

  ///showSuccess展示成功的布局
  Widget buildContent(BuildContext context);


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _createAppBar(context),
      body: buildBody(context),
      drawer: showDrawer() ? createDrawer() : null,
    );
  }

  ///AppBar生成逻辑
  AppBar? _createAppBar(BuildContext context) {
    if (showTitleBar()) {
      return createAppBar(
          titleString(), showBackButton(), appBarActionWidget(context),
          titleWidget: titleWidget());
    } else {
      return null;
    }
  }

  ///创建AppBar ActionView
  List<Widget>? appBarActionWidget(BuildContext context){}

  ///构建侧边栏内容
  Widget createDrawer() {
    return Container();
  }

  ///构建Scaffold-body主体内容
  Widget buildBody(BuildContext context) {
    return controller.obx((state) => buildContent(context),
        onLoading: const Center(
          child: CircularProgressIndicator(),
        ),
        onError: (error) => createErrWidget(controller, error),
        onEmpty: createEmptyWidget(controller));
  }
  ///widget生命周期
  get lifecycle => null;

  @override
  State createState() => AutoDisposeState<T>();
}
class AutoDisposeState<T extends GetxController>
    extends State<BaseStatefulWidget>
    with
        AutomaticKeepAliveClientMixin<BaseStatefulWidget>,
        WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetBuilder<T>(
        tag: widget.tag,
        id: widget.updateId,
        builder: (controller) {
          return widget.build(context);
        });
  }

  @override
  void initState() {
    super.initState();
    if (widget.lifecycle != null) {
      WidgetsBinding.instance.addObserver(this);
    }
  }

  @override
  void dispose() {
    Get.delete<T>(tag: widget.tag);
    if (widget.lifecycle != null) {
      WidgetsBinding.instance.removeObserver(this);
    }
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (widget.lifecycle != null) {
      widget.lifecycle(state);
    }
  }

  @override
  bool get wantKeepAlive => true;
}
