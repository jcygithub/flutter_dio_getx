import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

/**
 *Created by Jcy
 *on 2022/3/8
 */
mixin ToastMixin{
   showToast(String? msg) {
    Fluttertoast.showToast(
        msg: msg!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 32.0.sp);
  }
}