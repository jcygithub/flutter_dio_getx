import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/**
 *Created by Jcy
 *on 2022/12/7
 */
///隐藏软键盘
///[context] 上下文
class CommentTools{
  static hideKeyboard(context){
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}