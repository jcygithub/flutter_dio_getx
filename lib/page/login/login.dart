import 'package:base_flutter_master/base/BaseStatefulWidget.dart';
import 'package:base_flutter_master/route/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';

class LoginPage extends BaseStatefulWidget<LoginLogic> {
 const LoginPage({Key? key}) : super(key: key);



  @override
  Widget buildContent(BuildContext context) {
    // TODO: implement buildContent
    return  Center(
      child: InkWell(
        child: Container(
          alignment: Alignment.center,
          height: 96.w,
          child: Text('Login'),
        ),
        onTap: (){
          Get.offNamed(AppRoutes.mainPage);
        },
      ),
    );
  }

}
