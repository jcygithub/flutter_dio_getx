import 'package:base_flutter_master/base/BaseStatefulWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class ServicePage extends BaseStatefulWidget<ServiceLogic> {
  const ServicePage({Key? key}) : super(key: key);

  @override
  Widget buildContent(BuildContext context) {
    // TODO: implement buildContent
    return const Center(
      child: Text('Service'),
    );
  }

}
