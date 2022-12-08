import 'package:base_flutter_master/base/BaseStatefulWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class FindPage extends BaseStatefulWidget<FindLogic> {
  const FindPage({Key? key}) : super(key: key);
  @override
  Widget buildContent(BuildContext context) {
    // TODO: implement buildContent
    return const Center(
      child: Text('Find'),
    );
  }
}
