import 'package:base_flutter_master/base/BaseStatefulWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class MinePage extends BaseStatefulWidget<MineLogic> {
  const MinePage({Key? key}) : super(key: key);

  @override
  Widget buildContent(BuildContext context) {
    // TODO: implement buildContent
    return const Center(

      child: Text('Mine'),
    );
  }

}
