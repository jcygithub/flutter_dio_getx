import 'dart:async';

import 'package:flutter/material.dart';

import 'init/Application.dart';
import 'init/GlobalConfig.dart';

void main() {
  //捕获异常
  runZonedGuarded(
        () => init(),
    // ignore: avoid_print
        (err, stace) => print(FlutterErrorDetails(exception: err, stack: stace)),
    zoneSpecification: ZoneSpecification(
      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
        if (line.length > 800) {
          parent.print(zone, '字符串长度为 ${line.length}');
        } else {
          parent.print(zone, line);
        }
      },
    ),
  );
}

void init() async {
  // 第三方初始化
  await GlobalConfig.init();
  runApp(Application());
}